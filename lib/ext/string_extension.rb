require "digest/md5"
require 'openssl'
require 'base64'

module ITunesTagger
  module Ext
    module StringExtension
      def md5
        Digest::MD5.new.update(self).to_s
      end
      
      def md5!
        self.replace md5
      end
      
      def des_encode(keyphrase='foobar')
        enc = OpenSSL::Cipher::DES.new
        enc.encrypt
        enc.pkcs5_keyivgen(keyphrase)
        Base64.encode64(enc.update(self) + enc.final)
      end
      
      def des_decode(keyphrase='foobar')
        s = Base64.decode64(self)
        dec = OpenSSL::Cipher::DES.new
        dec.decrypt
        dec.pkcs5_keyivgen(keyphrase)
        dec.update(s) + dec.final
      rescue StandardError
        # "bad decrypt" raised when invalid keyphrase are given.
        raise
      end
    end
  end
end

class String
  include ITunesTagger::Ext::StringExtension
end

