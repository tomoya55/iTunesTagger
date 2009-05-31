require File.dirname(__FILE__) + '/../lib/itunestagger/sessionfile'

describe ITunesTagger::SessionFile do
  
  it "should save to file with encyption and can decode when read" do
    string = 'himitsu'
    ITunesTagger::SessionFile.save_session(string)
    read_string = ITunesTagger::SessionFile.read_session
    read_string.should == string
  end
  
end