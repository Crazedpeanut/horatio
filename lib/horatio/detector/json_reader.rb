require 'json'

module Horatio
  module Detector
    module JSONReader
      def name
        info['name']
      end

      def version
        info['version']
      end
    end
  end
end
