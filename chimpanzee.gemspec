# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chimpanzee/version'

Gem::Specification.new do |spec|
  spec.name          = "chimpanzee"
  spec.version       = Chimpanzee::VERSION
  spec.authors       = ["Maciej Litwiniuk"]
  spec.email         = ["maciej@litwiniuk.net"]
  spec.summary       = %q{API wrapper for surveymonkey.net}
  spec.description   = %q{Simple API wrapper for surveymonkey.net API version 2.0}
  spec.homepage      = "https://github.com/prograils/chimpanzee"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "fakeweb", ["~> 1.3"]
  spec.add_runtime_dependency "httparty", ["~> 0.13.0"]

end
