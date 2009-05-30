require File.dirname(__FILE__) + '/../lib/ext/string_extension'

describe ITunesTagger::Ext::StringExtension do
  it "should generate the right md5 strings" do
    md5 = 'hoge'.md5
    md5.should == "ea703e7aa1efda0064eaa507d9e8ab7e"
  end
  
  it "should replace self with md5 when md5!" do
    str = "hoge"
    str.md5!
    str.should == "ea703e7aa1efda0064eaa507d9e8ab7e"
  end
end
