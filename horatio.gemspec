# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'horatio/version'

Gem::Specification.new do |spec|
  spec.name          = "horatio"
  spec.version       = Horatio::VERSION
  spec.authors       = ["Pauly Myjavec", "Rufus Post"]
  spec.email         = ["pauly@buzbox.net", "rufuspost@gmail.com"]
  spec.summary       = %q{Horatio, shipping your Docker images}
  spec.description   = %q{Horatio, shipping your Docker images from a CI server}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_dependency "nori"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "minitest", "~> 4"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "fakefs"
end
