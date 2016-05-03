module Horatio
  module Detector
    module IOHandler
      module ClassMethods
        def detect
          new.detect
        end
      end

      attr_reader :input, :output

      def default_input
        'horatio.json'
      end

      def default_output
        'horatio.json'
      end

      def initialize(input: nil, output: nil)
        @input = input || default_input
        @output = output || default_output
        @info = {}
        @read = false
      end

      def detect
        File.exists?(@input) ? true : nil
      end

      def memo_read
        return @info if @read
        return unless block_given?
        @info = yield
        @read = true
        @info
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
