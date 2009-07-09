

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

      @url          = URI.parse( Prowler::PROWL_URL )
      @username     = username
      @password     = password
      @http         = Net::HTTP.new( @url.host, @url.port )
      @http.use_ssl = true
    end

    def send_notification( application, event, description )

      options = Hash.new()

      options[:application] = application,
      options[:event]       = event,
      options[:description] = description

      http_request = Net::HTTP::Get.new( "#{@url.path}?#{options.urlencode()}" )

      begin
        http_request.basic_auth( @username, @password )
        @http.request( http_request )
      rescue => ex
        $stderr.puts( "Error: #{ex}" )
      end
    end
  end
end

