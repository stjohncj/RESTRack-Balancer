# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "restrack-balancer/version"

Gem::Specification.new do |s|
  s.name        = "restrack-balancer"
  s.version     = RESTRackBalancer::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Chris St. John']
  s.email       = ['chris@stjohnstudios.com']
  s.homepage    = 'http://github.com/stjohncj/RESTRack-Splitter'
  s.summary     = %q{A library for interacting with RESTful web services.  Use this to communicate with RESTRack based services.}
  s.description = %q{A library for interacting with RESTful web services.  Use this to communicate with RESTRack based services.}
  s.rubyforge_project = "restrack-splitter"
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'shoulda'
  s.add_runtime_dependency 'restrack-client'

end
