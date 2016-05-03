require 'horatio/helper/vcs'

module Horatio
  module VCS
    class Subversion

      include Horatio::Helper::VCS

      def self.detect
        ['.svn', '.subversion'].any? { |f| File.exist?(f) }
      end

      def latest_revision
        sh('svnversion').first.strip.split(':')[0]
      end

      def commit(file)
        run_sh "svn commit -m 'image release' #{file}"
      end

    end
  end
end
