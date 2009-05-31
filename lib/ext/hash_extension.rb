require 'uri'

module ITunesTagger
  module Ext
    module HashExtension
      def to_qs
        map {|k, v| [URI.encode(k.to_s), URI.encode(v.to_s)].join('=') }.join('&')
      end
    end  
  end
end
 
class Hash
  include ITunesTagger::Ext::HashExtension
end

