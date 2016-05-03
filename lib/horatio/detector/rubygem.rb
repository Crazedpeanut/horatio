require 'horatio/detector/validator'
require 'horatio/detector/null_writer'

module Horatio
  module Detector
    class RubyGem
      include Validator
      include NULLWritter

      def initialize
        File.open(Dir.glob('*.gemspec').first, 'r') { |f| @spec_file = f.read }
      end

      def self.detect
        Dir.glob('*.gemspec').any?
      end

      def name
        @spec_file.match(/spec\.name.*$/i).to_s.split('=')[1].strip.gsub(/[\'\"\\]/, '')
      end

      def version
        File.open(Dir.glob('lib/**/version.rb').first, 'rb') { |f| @version_file = f.read }
        @version_file.match(/(\d.)+\d/).to_s.strip.gsub(/[\'\"\\]/, '')
      end

      def description
        'Ruby gemspec'
      end
    end
  end
end
