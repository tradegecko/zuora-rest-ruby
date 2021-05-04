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
  s.add_development_dependency('rspec')

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- spec/*`.split("\n")
  s.require_paths    = ["lib"]
end
