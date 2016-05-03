require 'spec_helper'
require 'json'

describe Horatio::Detector::Dynamic do
  before do
    FakeFS.activate!
    @detector = Horatio::Detector::Dynamic.new(input: 'spec/fixtures/dynamic')
  end

  it "correctly implements the name method" do
    assert_equal('docker-project', @detector.name)
  end

  it "correctly implements the version method" do
    assert_equal('0.0.1', @detector.version)
  end

  after { FakeFS.deactivate! }
end
