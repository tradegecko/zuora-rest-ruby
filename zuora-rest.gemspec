$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'zuora/version'

Gem::Specification.new do |s|
  s.name             = "zuora-rest"
  s.version          = Zuora::VERSION
  s.date             = "2016-01-28"
  s.summary          = "Lite Zuora REST API client"
  s.description      = "Basic REST API client to make simple subscription system on Zuora work"
  s.authors          = ["Gherry Harahap"]
  s.email            = ["gherry@tradegecko.com"]
  s.homepage         = "http://rubygems.org/gems/zuora-rest"
  s.license          = "MIT"
  s.extra_rdoc_files = ["LICENSE", "README.md"]

  s.add_dependency('httparty')
  s.add_development_dependency('pry', '~> 0.10.3')
  s.add_development_dependency "bundler", "~> 2.1.4"
  s.add_development_dependency "rake", "~> 13.0"
  s.add_development_dependency 'rspec-rails', '~> 3.8', '>= 3.8.2'
  s.add_development_dependency "rspec-expectations", "~> 3.0"
  s.add_development_dependency "webmock", '~> 3.8.3'
  s.add_development_dependency "rails", "~> 5.2.0"


  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- test/*`.split("\n")
  s.require_paths    = ["lib"]
end
