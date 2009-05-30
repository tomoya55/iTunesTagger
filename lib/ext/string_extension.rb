require "digest/md5"

module ITunesTagger
  module Ext
    module StringExtension
      def md5
        Digest::MD5.new.update(self).to_s
      end
      
      def md5!
        self.replace md5
      end
    end
  end
end

class String
  include ITunesTagger::Ext::StringExtension
end

