#!/usr/bin/ruby


require 'prowl/gateway'


module Prowl
  #
  # A concrete user Prowl gateway
  # 
  class Prowler < Gateway

    Prowler::USERNAME    = 'user.name'
    Prowler::PASSWORD    = 'credentials'

    def initialize( )

      super( Prowler::USERNAME, Prowler::PASSWORD )
    end
  end
end
