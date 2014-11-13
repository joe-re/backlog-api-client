# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'backlog-api-client/version'

Gem::Specification.new do |spec|
  spec.name          = 'backlog-api-client'
  spec.version       = BacklogApiClient::VERSION
  spec.authors       = ['joe-re']
  spec.email         = ['joe.tialtngo@gmail.com']
  spec.summary       = ''
  spec.description   = 'This is a simple and easy-to-use Backlog Restful Api client.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
