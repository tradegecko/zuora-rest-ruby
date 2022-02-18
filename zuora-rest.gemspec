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
  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "rspec-expectations", "~> 3.0"
  s.add_development_dependency "webmock"
  s.add_development_dependency "rails", "~> 4.2.0"


  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- test/*`.split("\n")
  s.require_paths    = ["lib"]
end
