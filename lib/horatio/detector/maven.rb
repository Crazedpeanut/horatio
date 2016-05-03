require 'nori'

require 'horatio/detector/validator'
require 'horatio/detector/io_handler'
require 'horatio/detector/null_writer'

module Horatio
  module Detector
    class Maven
      include Validator
      include IOHandler

      def default_input
        'pom.xml'
      end

      def info
        memo_read do
          File.open('pom.xml', 'r') { |f| Nori.new.parse(f.read) }
        end
      end

      def name
        info['project']['artifactId']
      end

      ##
      # Maven version reader
      #
      # We need to decrease the number if we see SNAPSHOT, this is becasue
      # maven increments it in anticipation for the next build
      #
      def version
        version =  info['project']['version'] || info['project']['parent']['version']
        return version unless version =~ /-SNAPSHOT$/
        version = version.split('-')[0]
        version = version.split('.')
        minor = version.last.to_i > 1 ? version.last.to_i - 1 : version.last
        version[-1] = minor
        version.join('.')
      end

      def description
        'JAVA Maven pom.xml'
      end
    end
  end
end
