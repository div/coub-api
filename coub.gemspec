# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coub/version'

Gem::Specification.new do |spec|
  spec.name          = "coub"
  spec.version       = Coub::VERSION
  spec.authors       = ["Igor Davydov"]
  spec.email         = ["iskiche@gmail.com"]
  spec.summary       = %q{Simple ruby wrapper around public part of coub.com api}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "webmock"
  spec.add_dependency "faraday", ['>= 0.7', '<= 0.9']
  spec.add_dependency "faraday_middleware", '~> 0.8'
  spec.add_dependency "hashie"
end
