require 'logger'
require "win32ole"
require 'pp'
require "win32ole_pp"

class String
	# mini_player => MiniPlayer
	def camelize
		self[0,1] = self[0,1].upcase if self =~ /^[a-z]/
		self.gsub(/_([a-z])/) { $1.upcase }
	end

	# MiniPlayer => mini_player
	def underscore
		gsub(/::/, '/').
			gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
			gsub(/([a-z\d])([A-Z])/, '\1_\2').
			tr("-", "_").
			downcase
	end
end

module WIN32OLE_MORE
	
	class NotConnectedError < StandardError; end
	
	# Type objects represent OLE type library info.
	class Type
		# returns the ProgIDs found in the system
		# ==== DESCRIPTION
		# removes ProgIDs which ends with .[0-9] such as "Word.Application.1"
		def self.progids
			WIN32OLE_TYPE.progids.uniq.delete_if { |id| id =~ /.*\.[0-9]+$/ }.sort
		end
		
		# returns the names of Type Libraries found in the system
		def self.typelibs
			WIN32OLE_TYPE.typelibs.uniq.sort
		end
	end
	
	class OleFinder
		
		DEFINED_TYPES = {
			"VOID"    => {:alias => "nil"}, 
			"UI4"     => {:alias => Fixnum}, 
			"BOOL"    => {:alias => "true | false"},
			"I4"      => {:alias => Fixnum},
			"BSTR"    => {:alias => String}, 
			"HRESULT" => {:alias => Fixnum}, 
			"UNKNOWN" => {:alias => "nil"}
		}
		
		def self.find_unknown_types(ole, founds = DEFINED_TYPES)
			error_types = {}
			found_types = founds.keys
			ole.ole_methods.each do |m| 
				next if found_types.include?(m.return_type.to_s)
				
				obj = nil
				begin
					if m.invoke_kind == "PROPERTYGET" && m.params.size == 0
						obj = ole.send(m.name)
					elsif m.invoke_kind == "PROPERTYGET" && m.params.size == 1 && m.params.first.ole_type == "I4"
						obj = ole.send(m.name, 1)
					end
				rescue WIN32OLERuntimeError => e
					$stderr.puts e
					obj = nil
				end
				
				if obj && obj.kind_of?(WIN32OLE)
					founds[m.return_type.to_s] = {:obj => obj}
					founds = find_unknown_types(obj, founds)
				elsif obj
					founds[m.return_type.to_s] = {:alias => obj.class}
				else
					error_types[m.return_type.to_s] ||= {:error => []}
					error_types[m.return_type.to_s][:error] << "#{m.return_type} : #{m.invoke_kind} : #{m.name}(#{m.params.map{|p| p.name }.join(',')})"
				end
			end
			
			error_types.each do |k, v|
				founds[k] ||= v
			end
			
			founds
		end
	end
	
	class Generator
		
		#----------------------------------------------------------------------------
		# Initializer
		# ==== PARAMS
		# server :: OLE Automation Server name
		def initialize(server, logname=nil)
			logname ||= $stdout
			@logger = Logger.new(logname)
			@server = server

			@root = nil
			@types = {}
		end
		
		#----------------------------------------------------------------------------
		# Generate a source file for OLE object
		# ==== PARAMS
		# name :: Module Name
		def generate(name = nil)
			@root = WIN32OLE.new(@server)
			@types = OleFinder.find_unknown_types(@root)
			name = name || @server.split('.')[0].camelize
			File.open(name.downcase + ".rb", "w") do |writer|
				writer.write generate_module(name)
			end

			@types.each do |k, v|
				if v[:error]
					v[:error].each do |l|
						@logger.warn "no class for #{k} : #{l}" 
					end
				end
			end
		end
		
		#----------------------------------------------------------------------------
		# Generate a module definitions
		# ==== PARAMS
		# name :: Module Name
		def generate_module(name)
			@logger.debug("mod/#{name}")
			str = []
			str << ""
			str << <<EOF
require 'win32ole'

module #{name}
#{generate_root_class(name)}
#{generate_new_classes}
end

if __FILE__ == $0
  puts "defined methods of #{name} are"
  methods = #{name}::#{name}.new.methods - Object.methods
  puts methods.sort
end

__END__
EOF
			str.join("\n")
		rescue WIN32OLERuntimeError => e
			@logger.error(e)
		end
		
		#----------------------------------------------------------------------------
		# Generate a class definition
		# ==== PARAMS
		# nil
		def generate_new_classes
			exp = []
			@types.sort_by { |k, v| k.to_s }.each do |key, value|
				if value[:obj] && value[:obj].kind_of?(WIN32OLE)
					exp << generate_class(value[:obj], key) 
				end
			end
			exp.join("\n")
		end
		
		#----------------------------------------------------------------------------
		# Generate a root class definition
		# ==== PARAMS
		# name :: class name
		def generate_root_class(name)
			@logger.debug("c/#{name}")
			str = []
			str << <<EOF
  # #{name}
  # ==== DESCRIPTION
  # #{@root.ole_obj_help.helpstring}
  class #{name}
    # Initializer
    # ==== DESCRIPTION
    # create new instance and connect to OLE Automation Server
    def initialize
      @ole = WIN32OLE.new('#{@server}')
    end
  #{generate_methods(@root, "    ")}
  end
EOF
			str.join("\n")
		rescue WIN32OLERuntimeError => e
			@logger.error e
		end
		
		#----------------------------------------------------------------------------
		# Generate a class definition
		# ==== PARAMS
		# ole  :: WIN32OLE object
		# name :: class name
		def generate_class(ole, name)
			@logger.debug("c/#{name}")
			str = []
			str << <<EOF
  # #{name}
  # ==== DESCRIPTION
  # #{ole.ole_obj_help.helpstring}
  class #{name}
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
    #{generate_methods(ole, "    ")}
  end
EOF
			str.join("\n")
		rescue WIN32OLERuntimeError => e
			@logger.error e
		end
		
		#----------------------------------------------------------------------------
		# Generate a method definition
		# ==== PARAMS
		# ole  :: WIN32OLE object
		def generate_methods(ole, indent="")
			methods = []
			ole.ole_methods.sort_by {|m| m.name }.map do |m|
				next unless m.visible?
				@logger.debug("c/#{ole.ole_obj_help.name}##{m.name}")
				str = []
				str << ""
				str << "# #{m.name}"
				str << "# ==== DESCRIPTION"
				str << "# #{m.helpstring}"
				if m.invoke_kind == "FUNC"
					str << "# ==== PARAMS"
					if m.params.empty?
						str << "# ()"
					else
						str << "# " + m.params.map {|p| p.ole_type + insert_alias_helper(p.ole_type) + " " + p.name + (p.optional? ? "(optional)" : "") }.join("\n#{indent}# ")
					end
				elsif m.invoke_kind == "PROPERTYPUT"
					str << "# ==== PARAMS"
					str << "# value"
				end
				str << "# ==== RETURNS"
				str << "# #{m.return_type}#{insert_alias_helper(m.return_type)}"
				case m.invoke_kind
				when "PROPERTYGET"
					str << "def #{m.name.underscore}"
					str << "  " + wrap_return(m.return_type, "@ole.#{m.name}")
					str << "end"
				when "PROPERTYPUT"
					str << "def #{m.name.underscore}(value)"
					str << "  @ole.#{m.name} = value"
					str << "  nil"
					str << "end"
				when "FUNC"
					params = m.params.map { |p| p.name.to_s.underscore }.join(', ')
					str << "def #{m.name.underscore}(#{params})"
					str << "  " + wrap_return(m.return_type, "@ole.#{m.name}(#{params})")
					str << "end"
				end
				methods << str.map {|l| indent + l }.join("\n")
			end
			methods.join("\n")
		end
		
		#----------------------------------------------------------------------------
		# Add type initializer before return value
		# ==== PARAMS
		# type :: name of the return value
		# exp :: expression for return
		def wrap_return(type, exp)
			if @types[type] && @types[type][:obj]
				exp = "#{type}.new(#{exp})"
			end
			exp
		end

		def insert_alias_helper(type)
			@types[type] && @types[type][:alias] ? "(" + @types[type][:alias].to_s + ")" : ""
		end
	end
	
	def generate_class(server, name, recursive=true)
		Generator.generate(server, name)
	end
	module_function :generate_class
	
end

if __FILE__ == $0
	WIN32OLE_MORE::Generator.new('iTunes.Application', 'itunes.log').generate
end

__END__