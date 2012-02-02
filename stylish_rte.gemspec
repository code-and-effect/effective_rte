# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "stylish_rte"
  s.version     = "0.1"
  s.authors     = ['AgileStyle Inc.']
  s.email       = ['info@agilestyle.com']
  s.homepage    = "http://github.com/AgileStyleInc/stylish_rte"
  s.summary     = "Rails gem implementation of the Stylish Rich Text Editor"
  s.description = "Formtastic aware WYSIWYG text-area editor"

  s.rubyforge_project = "stylish_rte"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
