begin
  %w[opt_parser yaml_loader config log cli_application].each { |library| require "prowl/#{library}" }
rescue LoadError => le
  $stderr.puts( le.message )
end