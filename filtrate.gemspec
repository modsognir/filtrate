# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "filtrate/version"

Gem::Specification.new do |s|
  s.name        = "filtrate"
  s.version     = Filtrate::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jared Fraser"]
  s.email       = ["j.fraser@modsognir.com"]
  s.homepage    = "http://github.com/modsognir/filtrate"
  s.summary     = %q{Rails record filtering}
  s.description = %q{Helpers for building interfaces to filter records easily}

  s.rubyforge_project = "filtrate"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
