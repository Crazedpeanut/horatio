require "horatio/detector/docker"
require "horatio/detector/rubygem"
require "horatio/detector/maven"
require "horatio/detector/node_package"
require "horatio/detector/dynamic"

module Horatio
  module Detector
    def self.detect
      detected = [Dynamic, Docker, Maven, RubyGem, NodePackage].detect { |d| d.detect }
      detected ? detected.new : raise("couldn't detect a supported project type, takes docker, maven, gem, horatio")
    end
  end
end
