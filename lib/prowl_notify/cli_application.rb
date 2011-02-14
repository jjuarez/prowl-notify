module ProwlNotify
  class CliApplication
    
    def self.run( event, description )
      
      Config.load( Choice.choices[:config] )
      Prowler.new( :application => Config.application, :api_key => Config.api_key ).notify( event, description )
    rescue Exception => e
      $stderr.puts( e.message )
    end
  end
end