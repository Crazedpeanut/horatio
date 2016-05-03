require 'json'

module Horatio
  module Detector
    module JSONWriter
      def increment(releaser)
        increment_version
        if ENV['DRY_RUN']
          color { Log.info "dry run: would've saved updated #{output}" }
          return
        end
        color { Log.info "saving updated #{output}" }
        File.open(output, 'w') { |f| f.write(JSON.pretty_generate(info)) } unless ENV['DRY_RUN']
        releaser.vcs.commit(output)
      end

      def increment_version
        parts = info['version'].split('.')
        parts[-1] = parts[-1].to_i + 1
        version = parts.join('.')
        color { Log.info "incrementing version from #{info['version']} to #{version}"}
        info['version'] = version
      end
    end
  end
end
