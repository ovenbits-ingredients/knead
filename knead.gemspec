# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'knead/version'

Gem::Specification.new do |s|
  s.name          = "knead"
  s.version       = Knead::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["John Tornow"]
  s.email         = ["jt@ovenbits.com"]
  s.homepage      = "http://github.com/ovenbits-ingredients/knead-rails"
  s.summary       = "Bug logging for your Rails app."
  s.description   = %Q{A basic bug logger for Rails and Redis.}
  s.files         = Dir.glob("{app,config,lib}/**/*") + %w(README.md)
  s.require_paths = ["lib"]

  s.required_ruby_version     = Gem::Requirement.new('>= 1.9.2')

  s.add_dependency 'coffee-script'
  s.add_dependency 'sass'
  s.add_dependency 'eco'
  s.add_dependency 'rails', '>= 3.2.3'
  s.add_dependency 'redis'
end