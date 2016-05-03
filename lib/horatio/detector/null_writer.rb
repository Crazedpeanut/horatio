require 'json'

module Horatio
  module Detector
    module NULLWritter
      def increment(_release)
        color { Log.info "skipping incrementation of version number, we rely on the #{description} for that" }
      end
    end
  end
end
