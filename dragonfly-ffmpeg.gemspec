# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dragonfly-ffmpeg/version"

Gem::Specification.new do |s|
  s.name        = "dragonfly-ffmpeg"
  s.version     = EnMasse::Dragonfly::FFMPEG::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jamie Winsor"]
  s.email       = ["jamie@enmasse.com"]
  s.homepage    = ""
  s.summary     = %q{A video manipulation plugin for Dragonfly }
  s.description = %q{FFMPEG libraries for processesing, encoding, analysing and generating videos with Dragonfly}

  s.rubyforge_project = "dragonfly-ffmpeg"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'dragonfly', '>= 0.9'
  s.add_dependency 'streamio-ffmpeg', '>= 0.8.0'
  s.add_development_dependency 'rspec', '>= 2.6.0'
end
