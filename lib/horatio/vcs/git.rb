require "open3"
require "horatio/helper/vcs"

module Horatio
  module VCS
    class Git

      include Horatio::Helper::VCS

      def self.detect
        sh('git rev-parse HEAD').last.exitstatus == 0
      end

      def latest_revision
        sh('git rev-parse --short HEAD').first.strip
      end

      def commit(file)
          color { Log.info "Adding remote before pushing verion update: #{remote_url}" }
          sh "git remote rm horatio &> /dev/null"
          run_sh "git remote add horatio #{remote_url}"
          run_sh "git commit -m 'image release' #{file}"
	  run_sh "git push horatio `git branch | grep \* | cut -d ' ' -f2`"
      end

      def remote_url
        begin
          url = @options.fetch('git-repo-url')
        rescue => e
          color(ERROR) { Log.error "Since Horatio 1.0 you must specify a remote repo URL when building a docker only / horatio build" }
          color(ERROR) { Log.error "If you see this message update your build to look like the following example: 'horatio --git-repo-url http://github.com/test/test.git'" }

          raise e
        end

        url
      end

    end
  end
end
