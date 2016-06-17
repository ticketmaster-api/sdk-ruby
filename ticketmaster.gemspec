# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "ticketmaster-sdk"
  spec.version       = 1
  spec.authors       = ["Conner Fritz"]
  spec.email         = "conner.fritz@ticketmaster.com"
  spec.version       = '0.0.0'
  spec.date          = '2016-06-14'
  spec.summary       = "Ticketmaster Public SDK"
  spec.description   = "A simple Ruby API wrapper for the Ticketmaster Public APIs"
  spec.files         = ["lib/ticketmaster.rb"]
  spec.license       = 'MIT'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_dependency "faraday"
  spec.add_dependency "json"
end
