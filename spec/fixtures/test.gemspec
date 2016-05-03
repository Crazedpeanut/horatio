# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'horatio/version'

Gem::Specification.new do |spec|
  spec.name          = 'test-gem'
  spec.version       = Horatio::VERSION
  spec.authors       = ["Test"]
  spec.email         = ["test@example.com"]
  spec.summary       = %q{Horatio, shipping your Docker images}
  spec.description   = %q{Horatio, shipping your Docker images}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "minitest", "~> 4"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "fakefs"
  spec.add_dependency "nokogiri"
  spec.add_dependency "nori"
  spec.add_dependency "gemnasium-parser"
end
