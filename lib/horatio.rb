require 'logger'
require 'open3'
require 'json'

### BEGIN CONFIG ###
USE = <<-EOS
./build_docker_image.rb [<name> <version>]

set DRY_RUN=true if you would like debugging output

The Dockefile you have specified does not contain the required name and version
comments nor have you provided any via the CLI, please add the following after
FROM in you Dockerfile:

#name\=awesome-app
#version=0.0.1
#test_command=/bin/true
EOS

ERROR = 31
SUCCESS = 32
ATTN = 35

Log = Logger.new(STDOUT)
Log.level = Logger::INFO

def color (color=SUCCESS)
  printf "\033[#{color}m";
  yield
  printf "\033[0m"
end

begin
  raise if RUBY_VERSION =~ /^1\.8.*$/
rescue
  color(ERROR) { Log.fatal("This script only works on Ruby > 1.8") }
  exit 1
end

### END CONFIG ###

def sh(cmd)
  o, e, s = nil, nil, nil
  o, e, s = Open3.capture3(*cmd)
end

def run_sh(cmd)
  unless ENV['DRY_RUN']
    color { Log.info "executing command: #{cmd}" }
    o, e, s = sh(cmd)

    if s.exitstatus.zero?
      color { Log.info "succesfully executed command `#{cmd}` output:\n #{o}" }
    else
      raise "execution of `#{cmd}` failed output from STDERR was:\n #{e}\n STDOUT was:\n #{o}"
    end
  else
    color { Log.info "dry run: would've executed command `#{cmd}`" }
  end
end

require 'horatio/releaser'
require 'horatio/detector'
require 'horatio/vcs'
