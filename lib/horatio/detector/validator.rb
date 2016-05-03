module Horatio
  module Detector
    module Validator
      def validate_name
        color { Log.info "validating passed in name"}
        name.match(/^[\w\-\.]*$/i) ? true : raise("name specified using invalid format")
      end

      def validate_version
        color { Log.info "validating passed in version"}
        version.match(/^(\d+.)+\d+/i) ? true : raise("version specified using invalid format")
      end

      def validate
        validate_version
        validate_name
      end
    end
  end
end
