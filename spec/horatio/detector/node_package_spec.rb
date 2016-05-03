require 'spec_helper'

describe Horatio::Detector::NodePackage do
  before do
    FakeFS.activate!
    create_package_json
    @detector = Horatio::Detector::NodePackage.new
  end

  it "correctly implements the name method" do
    @detector.name.must_equal 'less'
  end

  it "correctly implements the version method" do
    @detector.version.must_equal '1.7.0'
  end

  after { FakeFS.deactivate! }
end
