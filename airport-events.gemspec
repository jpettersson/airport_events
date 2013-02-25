# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "airport_events/version"

Gem::Specification.new do |s|
  s.name        = 'airport_events'
  s.version     = AirportEvents::VERSION
  s.date        = '2013-02-24'
  s.summary     = "Detect changes in WiFi network associations on MacOS"
  s.description = "Detect and log changes in WiFi network associations on MacOS. Utilizing the build in, but hidden 'airport' command."
  s.authors     = ["Jonathan Pettersson"]
  s.email       = 'jonathan@spacetofu.com'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage    = 'https://github.com/jpettersson/airport-events'
  s.executables << 'airport-log'

  s.add_development_dependency "rspec", "2.13.0"
  s.add_runtime_dependency "thor", "0.17.0"
  s.add_runtime_dependency "file-tail", "1.0.12"
  s.add_runtime_dependency "json"
end