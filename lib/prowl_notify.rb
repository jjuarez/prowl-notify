begin
  %w[rubygems
     choice
     logger
     yaml
     prowler 
     prowl_notify/opt_parser 
     prowl_notify/yaml_loader 
     prowl_notify/config 
     prowl_notify/log 
     prowl_notify/cli_application].each { |library| require library }
rescue LoadError => le
  $stderr.puts( le.message )
end