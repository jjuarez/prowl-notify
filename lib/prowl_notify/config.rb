module ProwlNotify
  module Config
    class << self

      def method_missing( method, *arguments, &block )
        
        @config ||= {}
        
        if( method =~/(.+)=$/)
          
          key           = method.to_s.delete( '=$' ).to_sym
          @config[key] = (arguments.length == 1) ? arguments[0] : arguments
        else
          
          return @config[method] if @config.keys.include?( method )
        end
      end

      def configure       
        yield self
      end
    
      def load( config_file )
  
        (@config = YAML.load_file( config_file )).keys { |k| config.key = @config[k] }
      end
    end
  end
end