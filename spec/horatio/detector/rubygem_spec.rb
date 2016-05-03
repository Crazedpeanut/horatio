require 'spec_helper'

describe Horatio::Detector::RubyGem do
  before do
    FakeFS.activate!
    create_ruby_gemspec
    create_gem_version
    @detector = Horatio::Detector::RubyGem.new
  end

  it "correctly implements the name method" do
    @detector.name.must_equal 'test-gem'
  end

  it "correctly implements the version method" do
    @detector.version.must_equal '0.0.5'
  end
#
#  it "correctly validates the test name" do
#    @detector.validate_name.must_equal true
#  end
#
#  it "correctly validates the version" do
#    @detector.validate_version.must_equal true
#  end

  after { FakeFS.deactivate! }
end
