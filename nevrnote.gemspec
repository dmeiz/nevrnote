# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nevrnote/version"

Gem::Specification.new do |s|
  s.name        = "nevrnote"
  s.version     = Nevrnote::VERSION
  s.authors     = ["Dan Hensgen"]
  s.email       = ["dan@methodhead.com"]
  s.homepage    = ""
  s.summary     = %q{A note taking app for Vim}
  s.description = %q{Save and search notes quickly in Vim.}

  s.rubyforge_project = "nevrnote"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
