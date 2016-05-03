require 'minitest/reporters'

Minitest::Reporters.use!([
  Minitest::Reporters::DefaultReporter.new,
  Minitest::Reporters::JUnitReporter.new
])
