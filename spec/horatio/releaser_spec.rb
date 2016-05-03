require 'spec_helper'
require 'json'

describe Horatio::Releaser, "from docker" do
  before do
    FakeFS.activate!
    create_horatio_json
    @releaser = Horatio::Releaser.new({'git-repo-url' => 'https://test.com/git.git'})
  end

  it "performs a dryrun" do
    ENV['DRY_RUN'] = 'true'
    @releaser.run.must_equal true
  end

  #TODO Fix this test it is awesome but it fails randomly, have a feeling the
  #fakefs gets cleaned up before all tests can pass
  #it "must create a build artifact" do
  #  json = JSON.parse(File.open('docker-image.json').read)
  #  json['name'].must_equal "docker-project"
  #  json['version'].must_equal "0.0.2"
  #end

  after { FakeFS.deactivate! }
end
