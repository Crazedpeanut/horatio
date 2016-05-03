require 'spec_helper'

describe Horatio::VCS::Git do

  before do
    @git = Horatio::VCS::Git.new({'git-repo-url' => 'https://github.com/git.git'})
  end

  #TODO create a proper git repo to test against
  it "correctly implements the detect method" do
    Horatio::VCS::Git.detect.instance_of? Horatio::VCS::Git
  end

  #TODO Test against real sha1sum
  it "correctly implements the latest revision method" do
    Horatio::VCS::Git.new.latest_revision.must_match(/^\w+$/i)
  end

  it "should correct read arguments passed into it" do
    @git.remote_url.must_equal 'https://github.com/git.git'
  end
end
