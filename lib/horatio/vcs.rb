require 'horatio/vcs/git'
require 'horatio/vcs/subversion'

module Horatio
  module VCS
    def self.detect(options={})
       vcs = [Git, Subversion].detect { |d| d.detect }
       vcs ? vcs.new(options) : abort('No VCS detected (git/subversion)')
    end
  end
end
