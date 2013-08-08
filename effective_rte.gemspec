# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "effective_rte"
  s.version     = "0.3.5"
  s.authors     = ['AgileStyle Inc.']
  s.email       = ['info@agilestyle.com']
  s.homepage    = "http://github.com/AgileStyleInc/effective_rte"
  s.summary     = "Rails gem implementation of the Effective Rich Text Editor"
  s.description = "Formtastic aware WYSIWYG text-area editor"

  s.rubyforge_project = "effective_rte"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("rails", ">= 3.1.0")
  s.add_dependency("jquery-rails")
  s.add_dependency("formtastic", "> 2.0")


  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
