require 'yaml'
require 'singleton'


module Prowl
  
  class ConfigError < StandardError
  end

  class Config
    include Singleton

    def initialize
      @configuration ||= YAMLLoader.load( Choice.choices[:config] ) # @@Megaacoplamiento !!!!
    rescue Exception => e
      raise ConfigError.new( e.message )
    end  

    def keys
      @configuration.keys
    end
    
    def []( key )
      @configuration[key.to_sym] if @configuration
    end
  end
end