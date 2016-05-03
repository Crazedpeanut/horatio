require 'json'

require 'horatio/detector/validator'
require 'horatio/detector/json_reader'
require 'horatio/detector/json_writer'
require 'horatio/detector/io_handler'

module Horatio
  module Detector
    class Docker
      include Validator
      include IOHandler
      include JSONReader
      include JSONWriter

      def default_input
        'horatio.json'
      end

      def default_output
        'horatio.json'
      end

      def default_commit
        true
      end

      def info
        memo_read do
          JSON.parse(File.open(input, 'r').read)
        end
      end

      def description
        'horatio.json'
      end
    end
  end
end
