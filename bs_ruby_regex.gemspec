# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bs_ruby_regex/version'

Gem::Specification.new do |spec|
  spec.name          = "bs_ruby_regex"
  spec.version       = BsRubyRegex::VERSION
  spec.authors       = ["Beepscore LLC"]
  spec.email         = ["support@beepscore.com"]
  spec.description   = %q{Searches text using regular expressions.}
  spec.summary       = %q{Searches text using regular expressions.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~>5.8"

  # Reference
  # http://guides.rubygems.org/specification-reference/
  spec.required_ruby_version = '~> 2.1.3'

end
