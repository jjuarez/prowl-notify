#!/usr/bin/ruby


require 'yaml'
require 'prowl/gateway'


module Prowl

  #
  # A concrete user Prowl gateway
  # 
  class FileProwler < Gateway

    def initialize( credentials_file = File.join( ENV['HOME'], '/.prowler' ) )

      abort "You must create a valid #{credentials_file} file to use this CLI." unless File.exist?( credentials_file )
      @credentials = YAML.load_file( credentials_file )

      super( @credentials['username'], @credentials['password'] )
    end
  end
end
