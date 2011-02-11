require 'yaml'


module Prowl

  class YAMLFileNotFoundError < StandardError
  end

  class YAMLLoader

    def self.load( file )
      YAML.load_file( file )
    rescue Exception => fnf
      raise YAMLFileNotFoundError.new( fnf.message )
    end
  end
end