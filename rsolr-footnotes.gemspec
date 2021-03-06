# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rsolr/footnotes/version'

Gem::Specification.new do |spec|
  spec.name          = "rsolr-footnotes"
  spec.version       = Rsolr::Footnotes::VERSION
  spec.authors       = ["Chris Beer"]
  spec.email         = ["chris@cbeer.info"]

  spec.summary       = %q{rails-footnotes for rsolr}
  spec.homepage      = "http://github.com/cbeer/rsolr-footnotes"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'rails'
  spec.add_runtime_dependency 'rails-footnotes', '~> 4.0'
  spec.add_runtime_dependency 'rsolr'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
