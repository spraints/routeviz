# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "routeviz/version"

Gem::Specification.new do |s|
  s.name        = "routeviz"
  s.version     = Routeviz::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Matt Burke']
  s.email       = ['spraints@gmail.com']
  s.homepage    = ""
  s.summary     = %q{Visual multi-host traceroute}
  s.description = %q{Generate a graphical representation of a traceroute to any number of hosts.}

  s.rubyforge_project = "routeviz"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
