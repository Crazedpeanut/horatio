require 'spec_helper'
require 'json'

describe Horatio::Detector::Docker do
  before do
    FakeFS.activate!
    create_horatio_json
    @detector = Horatio::Detector::Docker.new
  end

  it "correctly implements the name method" do
    @detector.name.must_equal 'docker-project'
  end

  it "correctly implements the version method" do
    @detector.version.must_equal '0.0.1'
  end

  it "correctly increments the version number" do
    @detector.increment_version.must_equal '0.0.2'
  end

  # Fix this valuable test
  #it "correctly increments the version number" do
  #  @detector.increment
  #  JSON.parse(File.open('horatio.json').read)['version'].must_equal '0.0.2'
  #end

  after { FakeFS.deactivate! }
end
