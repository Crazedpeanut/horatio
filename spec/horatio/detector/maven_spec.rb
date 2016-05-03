require 'spec_helper'

describe Horatio::Detector::Maven do
  before do
    FakeFS.activate!
    create_maven_pom
    @detector = Horatio::Detector::Maven.new
  end

  it "correctly implements the name method" do
    @detector.name.must_equal 'test-maven-project'
  end

  it "correctly implements the version method" do
    @detector.version.must_equal '1403.0.0.1'
  end

  it "correctly validates the test name" do
    @detector.validate_name.must_equal true
  end

  it "correctly validates the version" do
    @detector.validate_version.must_equal true
  end

  after { FakeFS.deactivate! }
end
