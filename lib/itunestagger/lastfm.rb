require "rubygems"
require "logger"
require "httpclient"
require "pp"

require File.dirname(__FILE__) + '/../ext'
require File.dirname(__FILE__) + '/sessionfile'

module ITunesTagger
  
  module LastFM
    
    URL      = 'https://www.last.fm'
    ROOT     = 'http://ws.audioscrobbler.com/2.0'
    API_KEY  = 'ea87a9c09e0c81408b2e0b73b37ba8a3'
    SECRET   = '89a97c48a9850220bc6ddf522ae09503'
    
    def parse_response(xmlstr)
      begin
        xmlstr.force_encoding("utf-8") if RUBY_VERSION >= "1.9.0"
        xml = REXML::Document.new(xmlstr)
      rescue REXML::ParseException => e
        puts e
      end
      raise StatusNotOkError unless xml._status == 'ok'
      xml
    end
    module_function :parse_response

    def construct_signatures(params)
      params[:api_key] = API_KEY
      str = params.keys.sort_by {|k| k.to_s }.map {|k| "#{k}#{params[k]}"}.join.concat(SECRET)
      str.md5
    end
    module_function :construct_signatures
    
    
    class API
      include LastFM
      
      # format :: rexml, raw
      def initialize(format='rexml')
        @logger = Logger.new STDOUT
        @format = format
      end
      
      def artist_get_events(artist)
        api_get('artist.getEvents', {:artist => artist})
      end
      
      def artist_get_images(artist, page=nil, limit=nil, order=nil)
        params          = {}
        params[:artist] = artist
        params[:page]   = page  if page
        params[:limit]  = limit if limit
        params[:order]  = order if order
        api_get('artist.getImages', params)
      end
      
      def artist_get_info(artist)
        api_get('artist.getInfo', {:artist => artist})
      end
      
      def artist_get_shouts(artist)
        api_get('artist.getShouts', {:artist => artist})
      end
      
      def artist_get_similar(artist, limit=nil)
        params          = {}
        params[:artist] = artist
        params[:limit]  = limit if limit
        api_get('artist.getSimilar', params)
      end
      
      def artist_get_top_albums(artist)
        api_get('artist.getTopAlbums', {:artist => artist})
      end
      
      def artist_get_top_fans(artist)
        api_get('artist.getTopFans', {:artist => artist})
      end
      
      def artist_get_top_tags(artist)
        api_get('artist.getTopTags', {:artist => artist})
      end
      
      def artist_get_top_tracks(artist)
        api_get('artist.getTopTracks', {:artist => artist})
      end
      
      def artist_search(artist, page=nil, limit=nil)
        params          = {}
        params[:artist] = artist
        params[:page]   = page  if page
        params[:limit]  = limit if limit
        api_get('artist.search', params)
      end
      
      private
      def api_get(method, params={})
        params[:method]  = method
        params[:api_key] ||= API_KEY
        @logger.debug "GET #{ROOT + '/?' + params.to_qs}" if @logger
        response = HTTPClient.new.get_content(ROOT + '/?' + params.to_qs) 
        @format == 'rexml' ? parse_response(response) : response
      end
    end
    
    class AuthAPI < API
      include LastFM
      
      def initialize(username, password, format='rexml')
        super(format)
        @username = username
        @password = password
      end
      
      def artist_add_tags(artist, tags)
        raise "Maximum of tags is 10" if tags.split(",").size > 10
        params          = {}
        params[:artist] = artist
        params[:tags]   = tags
        api_post('artist.addTags', params)
      end
      
      def artist_get_tags(artist)
        api_get('artist.getTags', {:artist => artist})
      end
      
      def artist_remove_tag(artist, tag)
        params          = {}
        params[:artist] = artist
        params[:tag]    = tag
        api_post('artist.removeTags', params)
      end
      
      def artist_share(artist, recipient, message=nil)
        params             = {}
        params[:artist]    = artist
        params[:recipient] = recipient
        params[:message]   = message if message
        api_post('artist.share', params)
      end
      
      def artist_shout(artist, message)
        params             = {}
        params[:artist]    = artist
        params[:message]   = message
        api_post('artist.share', params)
      end
      
      private
      def api_get(method, params={}, logger=nil)
        params[:method]  = method
        params[:api_key] ||= API_KEY
        params[:sk]      ||= Authentication.get_session_key(@username, @password)
        params[:api_sig] ||= LastFM::construct_signatures(params)
        @logger.debug "GET #{ROOT + '/?' + params.to_qs}" if @logger
        response = HTTPClient.new.get_content(ROOT + '/?' + params.to_qs)
        @format == 'rexml' ? parse_response(response) : response
      end
      
    end
    
    # Class which mangages Session Key and API Token
    # 
    class Authentication
      include LastFM, SessionFile
      
      def self.get_session_key(username, password)
        @instance ||= Authentication.new
        @instance.session_key if @instance.has_session_key? 
        
        @instance.has_session_file? \
          ? @instance.read_session_file \
          : @instance.get_authentication(username, password)
      end
      
      attr_reader :session_key
    
      def initialize
        @logger      = Logger.new $stdout
        @client      = HTTPClient.new
        @token       = ''
        @session_key = ''
      end
      
      def token
        @token ||= get_token
      end
      
      def has_token?
        !(@token.nil? || @token.empty?)
      end
      
      def has_session_key?
        !(@session_key.nil? || @session_key.empty?)
      end
      
      def has_session_file?
        test(?f, SESSION_FILE) 
      end
      
      def read_session_file
        @session_key = read_session
        @session_key
      end
    
      def get_authentication(username, password)
        #=> auth step 1
        @logger.info 'getting a token'
        @token = get_token unless has_token?
        @logger.debug "token=#{@token}"
      
        #=> login to the websystem using httpclient
        @logger.info 'logging in as a user'
        login(username, password)
      
        #=> auth step 2
        @logger.info 'getting authentication of user granting...'
        get_auth_from_user
        
        #=> auth step 3
        @logger.info 'getting web session key'
        @session_key = get_web_session unless has_session_key?
        @logger.debug "session_key=#{@session_key}"
      
        save_session(@session_key)
        @sessoin_key
      end
    
      # <form action="/login/" method="post">
      # <input type="hidden" value="" name="refererKey"/>
      # <input id="username" type="text" value="" name="username"/>
      # <input id="password" type="password" value="" name="password"/>
      # <input type="submit" name="login" value="Come on in"/>
      # </form>
      def login(username, password)
        # define new callback for Lastfm.
        # ====
        # default_redirect_client will raise error 
        # because last.fm tries to redirect us 
        # from https://www.last.fm/login to http://www.last.fm/
        class << @client
          # File lib/httpclient.rb, line 566
          def unsecure_redirect_uri_callback(uri, res)
            newuri = URI.parse(res.header['location'][0])
            unless newuri.is_a?(URI::HTTP)
              newuri = uri + newuri
              STDERR.puts("could be a relative URI in location header which is not recommended")
              STDERR.puts("'The field value consists of a single absolute URI' in HTTP spec")
            end
            puts "redirect to: #{newuri}" if $DEBUG
            newuri
          end
        end
        @client.redirect_uri_callback = @client.method(:unsecure_redirect_uri_callback)
      
        @logger.debug "POST #{URL + '/login/'} : #{{:username => username, :password => password, :refererKey => '', :login => 'Come on in'}.to_qs}"
        @client.post_content(URL + '/login/', :username => username, :password => password, :refererKey => "", :login => "Come on in")
      end
    
      # 2. Fetch a request token
      # ==== DESCRIPTION
      # Make an API method call to the auth.getToken service. 
      # You should send the following arguments to that call:
      # api_key: Your 32-character API Key.
      # api_sig: A 32-character API method signature
      # ==== RETURN
      # This will return a token. 
      def get_token
        @logger.debug "GET #{ROOT + '/?method=auth.gettoken&api_key=' + API_KEY}"
        xml = parse_response( @client.get_content(ROOT + '/?method=auth.gettoken&api_key=' + API_KEY) )
        xml.token.text
      end
    
      # 3. Request authorization from the user
      # ==== DESCRIPTION
      # Your application needs to open a web browser and send the user to 
      # last.fm/api/auth 
      # with your API key and auth token as parameters. 
      # Use an HTTP GET request. Your request will look like this:
      # 
      # http://www.last.fm/api/auth/?api_key=xxxxxxxxxxx&token=xxxxxxxx
      # 
      # If the user is not logged in to Last.fm, 
      # they will be redirected to the login page 
      # before being asked to grant your application permission to use their account. 
      # On this page they will see the name of your application, 
      # along with the application description and logo as supplied in Section 1. 
      # Once the user has granted your application permission to use their account, 
      # the browser-based process is over and the user is asked to close their browser 
      # and return to your application.
      # ==== DEVELOPERS
      # <form id="frm" class="grant" name="frm" method="post" action="/api/grantAccess">
      # <input type="hidden" value="ea87a9c09e0c81408b2e0b73b37ba8a3" name="api_key"/>
      # <input type="hidden" value="ea87a9c09e0c81408b2e0b73b37ba8a3" name="api_key"/>
      # <input type="hidden" value="/" name="referer"/>
      # <input type="hidden" value="18cb5533915a35ee3084c178e514d81e" name="token"/>
      # <input type="submit" value="Yes, allow access" name="Submit"/>
      # </form>
      def get_auth_from_user
        # params = {:api_key => API_KEY, :token => @token}
        # @logger.debug "GET #{URL + '/api/auth/?' + params.to_qs}"
        # res = @client.get_content(URL + '/api/auth/?' + params.to_qs)
      
        params = {:api_key => API_KEY, :token => @token, :referer => '/', :Submit => 'Yes, allow access'}
        @logger.debug "POST #{URL + '/api/grantAccess'} : #{params.to_qs} "
        @client.post_content(URL + '/api/grantAccess', params)
      end
    
      # 4. Fetch A Web Service Session
      # ==== DESCRIPTION
      # Send your api key along with an api signature and your authentication token as arguments 
      # to the auth.getsession API method call. 
      # The parameters are defined as such:
      # - api_key: Your 32-character API Key.
      # - token: The authentication token received from the auth.getToken method call.
      # - api_sig: Your 32-character API method signature, as explained in Section 6
      # 
      def get_web_session
        params = {:api_key => API_KEY, :token => @token, :method  => 'auth.getSession'}
        params[:api_sig] = construct_signatures(params)
        @logger.debug "GET #{ROOT + '/?' + params.to_qs}"
        res = @client.get_content(ROOT + '/?' + params.to_qs)
        xml = parse_response(res)
        xml.session.key.text
      end
    
    end # End of class Authentication
    
  end # End of module LastFM
end