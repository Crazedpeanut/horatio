require 'bundler/gem_tasks'
require 'rake/testtask'
require 'minitest/reporters'

Minitest::Reporters.use!([
  Minitest::Reporters::DefaultReporter.new,
  Minitest::Reporters::JUnitReporter.new
])

Rake::TestTask.new(:test) do |t|
    t.libs << 'lib'
    t.libs << 'spec'
    t.pattern = 'spec/**/*_spec.rb'
end

task default: 'test'
