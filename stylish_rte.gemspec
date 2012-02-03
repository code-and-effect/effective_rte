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

  s.add_dependency("rails", ">= 3.1.0")
  s.add_dependency("jquery-rails")
  s.add_dependency("formtastic", "> 2.0")
  s.add_dependency("haml")
  s.add_dependency("carrierwave")

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end


#      create  config/initializers/ckeditor.rb
#       route  mount Ckeditor::Engine => '/ckeditor'
#      create  app/models/ckeditor/asset.rb
#      create  app/models/ckeditor/picture.rb
#      create  app/models/ckeditor/attachment_file.rb
#      create  app/uploaders/ckeditor_attachment_file_uploader.rb
#      create  app/uploaders/ckeditor_picture_uploader.rb
#      create  db/migrate/20120203133549_create_ckeditor_assets.rb
