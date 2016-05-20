# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubocop/facter/version'

Gem::Specification.new do |spec|
  # rubocop:disable Metrics/LineLength
  spec.name          = 'rubocop-facter'
  spec.version       = RuboCop::Facter::Version.current
  spec.authors       = ['Zee Alexander']
  spec.email         = ['zee@puppet.com']
  spec.license       = 'Apache-2.0'

  spec.summary       = 'RuboCop Custom Cops for Puppet/Facter Custom Facts'
  spec.homepage      = 'https://github.com/pizzaops/rubocop-facter'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.require_paths = ['lib']

  spec.required_ruby_version = ['>= 1.9.3']

  spec.add_dependency 'rubocop', '~> 0.33'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0', '< 11'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'
  # rubocop:enable Metrics/LineLength
end
