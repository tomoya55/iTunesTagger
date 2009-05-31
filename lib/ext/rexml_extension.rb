require "rexml/document"

# Extension of REXML::Element
# ==== Description
# refer to http://d.hatena.ne.jp/funnystone/20071015/1192463795
class REXML::Element
  
  def method_missing(name, *args)
    name = name.to_s
    if(name[0, 1] == '_')
      values = attributes[name[1..-1]]
    else
      values = get_elements("./#{name}")
    end
    raise NameError if values.nil? or values.empty?
    __return values
  end

  def __return(values)
    if values.size == 1
      v = values[0]
      class << v
        def [](key)
          return self if key == 0
        end
      end
      return v
    end
    values
  end
  protected :__return
end

# Extension of REXML::Element
# ==== Description
# refer to http://d.hatena.ne.jp/funnystone/20071015/1192463795
class REXML::Document
  
  def method_missing(name, *args)
    name = name.to_s
    if(name[0, 1] == '_')
      values = root.attributes[name[1..-1]]
    else
      values = root.get_elements("./#{name}")
    end
    raise NameError if values.nil? or values.empty?
    __return values
  end
end

