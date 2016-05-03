require 'json'

require 'horatio/detector/validator'
require 'horatio/detector/json_reader'
require 'horatio/detector/null_writer'

module Horatio
  module Detector
    class NodePackage
      include Validator
      include IOHandler
      include JSONReader
      include NULLWritter

      def default_input
        'package.json'
      end

      def info
        memo_read do
          File.open(input, 'r') { |f| JSON.parse(f.read) }
        end
      end

      def description
        'Node.js package.json'
      end
    end
  end
end
