require File.dirname(__FILE__) + '/../lib/itunestagger/lastfm'

describe ITunesTagger::LastFM::API do
  
  before(:each) do
    @api = ITunesTagger::LastFM::API.new
  end
  
  it "should return artist events" do
    xml = @api.artist_get_events("ColdPlay")
    xml.events._total.to_i.should > 0
    xml.should have_at_least(1).event
  end
  
  it "should return artist images" do
    xml = @api.artist_get_images("ColdPlay")
    xml.images._total.to_i.should > 0
    xml.images.should have_at_least(1).image
    xml.images.image[0].url.text.should_not be_empty
  end
  
  it "should return artist infos" do
    xml = @api.artist_get_info("ColdPlay")
    xml.artist.should_not be_nil
    xml.artist.mbid.text.should_not be_empty
    xml.artist.url.text.should_not be_empty
  end
  
  it "should return artist shouts" do
    xml = @api.artist_get_shouts("Billy Joel")
    xml.shouts._total.to_i.should > 0
    xml.should have_at_least(1).shout
  end
  
  it "should return artist similar" do
    xml = @api.artist_get_similar("ColdPlay")
    xml.similarartists._artist.downcase.should == "coldplay"
    xml.similarartists.should have_at_least(1).artist
  end
  
  it "should return artist top albums" do
    xml = @api.artist_get_top_albums("ColdPlay")
    xml.topalbums._artist.downcase.should == "coldplay"
    xml.topalbums.should have_at_least(1).album
  end
  
  it "should return artist top fans" do
    xml = @api.artist_get_top_fans("ColdPlay")
    xml.topfans._artist.downcase.should == "coldplay"
    xml.topfans.should have_at_least(1).user
  end
  
  it "should return artist top tags" do
    xml = @api.artist_get_top_tags("ColdPlay")
    xml.toptags._artist.downcase.should == "coldplay"
    xml.toptags.should have_at_least(1).tag
  end
  
  it "should return artist top tracks" do
    xml = @api.artist_get_top_tracks("Coldplay")
    xml.toptracks._artist.downcase.should == "coldplay"
    xml.toptracks.should have_at_least(1).track
  end
  
  it "should return artist search results" do
    xml = @api.artist_search("ColdPlay")
    xml.results.artistmatches.should have_at_least(1).artist
  end
  
end