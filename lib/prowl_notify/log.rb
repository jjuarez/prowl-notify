require 'logger'
require 'singleton'


module ProwlNotify
  
  class Log
    include Singleton
  
    DEFAULT_CHANNEL = STDERR
    DEFAULT_LEVEL   = ::Logger::DEBUG
    DEFAULT_OPTIONS = { :channel=>DEFAULT_CHANNEL, :level=>DEFAULT_LEVEL }
  
    def initialize( options=DEFAULT_OPTIONS )
    
      @logger       = Logger.new( options[:channel] )
      @logger.level = options[:level]
    end
  
    def method_missing( method_symbol, *arguments, &block )
  
      @logger.send( method_symbol, arguments ) if [:debug, :info, :warn, :error, :fatal, :level].include?( method_symbol )
    end
  end
end