module ITunesTagger
  
  class StatusNotOkError < StandardError; end
  
  module SessionFile
    
    SESSION_FILE = File.dirname(__FILE__) + '/../../session.conf'
    
    def save_session(key)
      return if key.empty?
      File.open(SESSION_FILE, 'w') do |f|
        t = Time.now.to_i.to_s
        f.write t + ',' + key.des_encode(t)
      end
    end
    
    def read_session
      key = ''
      File.open(SESSION_FILE) do |f|
        t, code = f.read.split(',')
        key = code.des_decode(t)
      end
      key
    end
    
    module_function :read_session, :save_session
  end
end
