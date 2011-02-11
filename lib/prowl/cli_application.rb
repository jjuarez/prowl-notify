require 'prowler'

module Prowl
  
  class CliApplication
    
    def self.run( event, description )
      
      Prowler.new( 
       :application => Config.instance[:application], 
       :api_key     => Config.instance[:api_key] ).notify( event, description )
    end
  end
end