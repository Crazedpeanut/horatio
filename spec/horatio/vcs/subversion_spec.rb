require 'spec_helper'

describe Horatio::VCS::Subversion do

  before do
    FakeFS.activate!
    Dir.mkdir('.subversion')
  end

  it "correctly implements the detect method" do
    Horatio::VCS::Subversion.detect.must_equal true
  end

  after { FakeFS.deactivate! }
end
