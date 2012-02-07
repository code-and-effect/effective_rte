# encoding: UTF-8
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

require 'rspec/core/rake_task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'StylishRte'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'

Bundler::GemHelper.install_tasks

#require 'rake'
#require 'rspec/core/rake_task'
#require 'active_record'

#desc 'Generate the testing database'
#namespace :db do
#  namespace :test do
#    task :prepare do |t|
#      config = YAML::load(IO.read(File.dirname(__FILE__) + '/spec/database.yml'))
#      ActiveRecord::Base.establish_connection( config['test'] )
#      ActiveRecord::Base.connection()
#      ActiveRecord::Base.execute("create database #{config['test'][:database]} CHARACTER SET utf8 COLLATE utf8_general_ci;")
#    end
#  end
#end

desc "Run all examples"
RSpec::Core::RakeTask.new(:test) do |t|
  t.rspec_opts = %w[--color]
end

task :default => [:test]
