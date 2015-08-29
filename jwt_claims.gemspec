# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'jwt_claims/version'

Gem::Specification.new do |s|
  s.author = 'Gary Fleshman'
  s.email = 'gfleshman@newforge-tech.com'
  s.files = `git ls-files`.split("\n")
  s.homepage = 'https://github.com/garyf/jwt_claims'
  s.name = 'jwt_claims'
  s.platform = Gem::Platform::RUBY
  s.summary = 'JSON Web Token (JWT) Claims for Ruby'
  s.version = JwtClaims::VERSION
  # recommended
  s.license = 'MIT'
  # optional
  s.add_runtime_dependency('json_web_token', '~> 0.3')
  s.add_development_dependency('rspec', '~> 3.3')
  s.description = 'Modular implementation of JSON Web Token (JWT) Claims'
  s.required_ruby_version = '>= 2.0.0'
end
