require 'minitest/autorun'
require 'minitest/spec'
require 'fakefs/safe'
require 'json'
require 'horatio'
require 'logger'
require 'pry'

Dir[File.join(File.dirname(__FILE__), "support/**/*.rb")].each {|f| require f}

# Log to null for tests
Log =  Logger.new(File::NULL)
