ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require 'rspec/rails'
require 'database_cleaner'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

# Requires supporting ruby files with custom matchers and macros, etc, in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.use_transactional_examples = true

  config.include StylishRte::Engine.routes.url_helpers

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

#bundle exec rake -f spec/dummy/Rakefile db:drop db:create db:migrate db:test:prepare
#rake db:migrate RAILS_ENV=test
#rake test


# this is unused
#def load_schema
#  config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))

#  ActiveRecord::Base.establish_connection( config['test'] )
#  ActiveRecord::Base.connection()
#  ActiveRecord::Migrator.migrate("../lib/generators/stylish_rte/templates/migrations/create_assets.rb")
#end
