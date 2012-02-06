# encoding: UTF-8
require 'rubygems'
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake'
require 'rspec/core/rake_task'
require 'active_record'

desc 'Generate the testing database'
namespace :db do
  namespace :test do
    task :prepare do |t|
      config = YAML::load(IO.read(File.dirname(__FILE__) + '/spec/database.yml'))
      ActiveRecord::Base.establish_connection( config['test'] )
      ActiveRecord::Base.connection()
      ActiveRecord::Base.execute("create database #{config['test'][:database]} CHARACTER SET utf8 COLLATE utf8_general_ci;")
    end
  end
end

desc "Run all examples"
RSpec::Core::RakeTask.new(:test) do |t|
  t.rspec_opts = %w[--color]
end

task :default => [:test]
