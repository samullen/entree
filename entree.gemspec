# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'entree/version'

Gem::Specification.new do |spec|
  spec.name          = "entree"
  spec.version       = Entree::VERSION
  spec.authors       = ["Samuel Mullen"]
  spec.email         = ["samullen@gmail.com"]
  spec.description   = %q{Run an accessibility audit on a file or URL from the command line.}
  spec.summary       = %q{Entree runs HTML_CodeSniffer assertions on a page via PhantomJS}
  spec.homepage      = "https://github.com/samullen/entree"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]
  spec.executables   = ['entree']

  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "awesome_print", "~> 1.6"
  spec.add_dependency "command_line_reporter", "~> 3.3"
  spec.add_dependency "oj", "~> 2.17"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 11"
end
