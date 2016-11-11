# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'byzantine/client/version'

Gem::Specification.new do |spec|
  spec.name          = 'byzantine-client'
  spec.version       = Byzantine::Client::VERSION
  spec.authors       = ['Maciej Gawel', 'Bartosz Zurkowski']
  spec.email         = ['m.gawel@hotmail.com', 'bartosz.zurkowski@codesthq.com']

  spec.summary       = 'Byzantine key-value store client'
  spec.description   = 'Byzantine key-value store client'
  spec.homepage      = 'https://github.com/iosr2016/byzantine-client'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'rubocop', '~> 0.44.1'
end
