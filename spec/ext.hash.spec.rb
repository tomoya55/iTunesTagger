require File.dirname(__FILE__) + '/../lib/ext/hash_extension'

describe ITunesTagger::Ext::HashExtension do
  
  it "should generate querystring" do
    params = {:a => 1, :b => "string", 'msg' => 'hello'}
    params.to_qs.should == "a=1&b=string&msg=hello"
  end
  
end
