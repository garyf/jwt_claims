# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jwt_claims/version'

Gem::Specification.new do |s|
  s.name          = 'jwt_claims'
  s.version       = JwtClaims::VERSION
  s.authors       = ['Gary Fleshman']
  s.email         = ['gfleshman@newforge-tech.com']

  s.summary       = 'JSON Web Token (JWT) Claims for Ruby'
  s.description   = 'Modular implementation of JSON Web Token (JWT) Claims'
  s.homepage      = 'https://github.com/garyf/jwt_claims'
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  s.require_paths = ['lib']

  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.0.0'

  s.add_runtime_dependency('json_web_token', '~> 0.3')

  s.add_development_dependency 'bundler', '~> 1.13'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'pry-byebug', '~> 3.4'
  s.add_development_dependency 'simplecov', '~> 0.12'
  s.add_development_dependency 'yard', '~> 0.9'
  s.add_development_dependency 'wwtd', '~> 1.3'
end
