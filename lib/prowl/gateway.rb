
require 'uri'
require 'net/http'
require 'net/https'


class String
  def urlencode( )
    gsub( /[^a-zA-Z0-9\-_\.!~*'()]/n ) { |x| sprintf( '%%%02x', x[0] ) }
  end
end


class Hash
  def urlencode( )
    collect { |k,v| "#{k.to_s().urlencode()}=#{v.to_s().urlencode()}" }.join('&')
  end
end


module Prowl
  class Gateway

    Gateway::PROWL_URL = "https://prowl.weks.net/api/add_notification.php"

    def initialize( username, password )

      @username         = username
      @password         = password
      @url              = URI.parse( Gateway::PROWL_URL )
      @http             = Net::HTTP.new( @url.host, @url.port )
      @http.use_ssl     = true
      @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end


    def build_options( application, event, description )

      options = Hash.new()

      options[:application] = application,
      options[:event]       = event,
      options[:description] = description

      return( options )
    end


    def send_notification( application, event, description )

      options      = build_options( application, event, description )
      http_request = Net::HTTP::Get.new( "#{@url.path}?#{options.urlencode( )}" )

      begin
        http_request.basic_auth( @username, @password )
        @http.request( http_request )
      rescue => ex
        $stderr.puts( "Error: #{ex}" )
      end
    end
  end
end

