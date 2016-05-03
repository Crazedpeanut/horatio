require 'json'

module Horatio
  class Releaser

    attr_accessor :release, :vcs

    def initialize(options={})
      @options = options
      @registry = @options['registry']
      @release = Horatio::Detector.detect
      color { Log.info "detected #{@release.description}" }
      @vcs = Horatio::VCS.detect(@options)
    end

    def generate_artifact
      contents = JSON.pretty_generate({'name'             => @release.name,
                                       'version'          => "#{@release.version}-#{@vcs.latest_revision}",
                                       'app_version'      => @release.version,
                                       'source_revision'  => @vcs.latest_revision,
                                       'url'              => "#{@registry}/#{@release.name}:#{@release.version}-#{@vcs.latest_revision}"})

      File.open('docker-image.json', 'w') { |f | f.write(contents); }
    end

    def run
      color { Log.info "Running Docker build for #{@release.name}-#{@release.version}" }

      @release.validate

      color { Log.info "latest revision is #{@vcs.latest_revision }" }

      no_cache = ENV['DOCKER_BUILD_NO_CACHE'] ? "--no-cache " : ""

      run_sh "docker build " + no_cache + "-t #{@registry}/#{@release.name}:#{@release.version}-#{@vcs.latest_revision} ."
      run_sh "docker push #{@registry}/#{@release.name}"

      generate_artifact

      @release.increment(self)

      return true
    end
  end
end
