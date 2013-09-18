# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xsrftoken/version'

Gem::Specification.new do |spec|
  spec.name          = "xsrftoken"
  spec.version       = Xsrftoken::VERSION
  spec.authors       = ["daudi amani"]
  spec.email         = ["dsaronin@gmail.com"]
  spec.description   = %q{XSRF token generation and validation gem with accompanying faraday-middleware}
  spec.summary       = %q{XSRF token generation and validation gem with accompanying faraday-middleware}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"


end
