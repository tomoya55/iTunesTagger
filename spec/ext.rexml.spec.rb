require File.dirname(__FILE__) + '/../lib/ext/rexml_document_extension'

describe "extended REXML" do
  
  before(:all) do
    xml = <<EOF
<xml>
  <data src="store.txt">
    <title>Shop1</title>
    <loc>Osaka</loc>
    <clip length="4" />
  </data>
  <data src="store.txt">
    <title>Shop2</title>
    <loc>Tokyo</loc>
    <clip length="2" />
  </data>
  <node>10</node>
  <node>20</node>
  <node>30</node>
</xml>
EOF
    @xml = REXML::Document.new xml
  end
  
  it "should return an array of child nodes" do
    @xml.data.size.should == 2
    @xml.node.size.should == 3
  end
  
  it "should return the child node if the size is one" do
    @xml.data[0].title.text.should == 'Shop1'
    @xml.data[0].loc.text.should   == 'Osaka'
    @xml.data[1].title.text.should == 'Shop2'
    @xml.data[1].loc.text.should   == 'Tokyo'
    @xml.node[0].text.should       == '10'
    @xml.node[1].text.should       == '20'
  end
  
  it "should return the attribute value" do
    @xml.data[0]._src.should         == 'store.txt'
    @xml.data[0].clip._length.should == '4'
    @xml.data[1].clip._length.should == '2'
  end
  
  it "should raise NameError when received undefined name" do
    lambda{ @xml.hoge }.should         raise_error(NameError)
    lambda{ @xml.data[0].foo }.should  raise_error(NameError)
    lambda{ @xml.data[0]._bar }.should raise_error(NameError)
  end
  
end