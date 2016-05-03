require 'json'

require 'horatio/detector/validator'
require 'horatio/detector/json_reader'
require 'horatio/detector/io_handler'
require 'horatio/detector/null_writer'

module Horatio
  module Detector
    class Dynamic
      include Validator
      include IOHandler
      include JSONReader
      include NULLWritter

      def default_input
        'horatio'
      end

      def info
        memo_read do
          out = `./#{input}`
          raise StandardError, "dynamic horatio exec failed: #{out}" unless out
          JSON.parse(out)
        end
      end

      def description
        'dynamic Horatio data generator'
      end
    end
  end
end
