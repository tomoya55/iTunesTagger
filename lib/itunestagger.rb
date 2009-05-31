#!/usr/local/bin/ruby

require File.dirname(__FILE__) + '/ext'

require File.dirname(__FILE__) + '/itunestagger/sessionfile'
require File.dirname(__FILE__) + '/itunestagger/lastfm'

module ITunesTagger
  
  class StatusNotOkError < StandardError; end
  
end

if __FILE__ == $0
  api = ITunesTagger::LastFM::API.new
  xml = api.artist_get_top_tags("Good Charlotte")
end

