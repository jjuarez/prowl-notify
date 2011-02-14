$:.unshift( File.join( File.dirname( __FILE__ ), 'prowl_notify' ) )

begin
  %w[rubygems
     choice
     yaml
     prowler
     config_context 
     mini_logger
     opt_parser 
     cli_application].each { |library| require library }
rescue LoadError => le
  $stderr.puts( le.message )
end