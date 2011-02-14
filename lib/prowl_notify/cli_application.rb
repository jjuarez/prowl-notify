module ProwlNotify
  class CliApplication
    
    def self.run( event, description )
      
      ConfigContext.load( Choice.choices[:config] )
      Prowler.new( :application => ConfigContext.application, :api_key => ConfigContext.api_key ).notify( event, description )
    rescue Exception => e
      MiniLogger.error( e.message )
    end
  end
end