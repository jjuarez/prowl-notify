module ProwlNotify
  Choice.options do
  
    header ''
    header ' Specific options:'

    option :config do
      short '-c'
      long  '--config=The config file'
      default '../config/settings.yml' 
    end

    option :event, :required=>true do
      short '-e'
      long  '--event=The event'
    end

    option :description, :required=>true do
      short '-d'
      long  '--description=The event'
    end

    separator " Common options:"

    option :help do
      short '-h'
      long  '--help'
      desc  "Show this screen"
    end

    separator ''
  end
end