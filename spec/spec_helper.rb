ENV["RAILS_ENV"] = "test"

require 'rubygems'
require 'bundler/setup'

require 'rails'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

require 'stylish_rte'  # this includes active_record

require 'rspec'

# Include every file in /app.
Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each { |f| require f; puts "Required #{f}" }

# Test database configuration
dbconfig = {
  :adapter  => 'postgresql',
  :database => 'carrierwave_test',
  :username => 'root',
  :encoding => 'utf8'
}

RSpec.configure do |config|
  # some (optional) config here

  config.mock_with :rspec
end

def load_asset_schema
  config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))

  ActiveRecord::Base.establish_connection( config['test'] )
  ActiveRecord::Base.connection()

  ActiveRecord::Migrator.migrate("../lib/generators/stylish_rte/templates/migrations/create_assets.rb")
end
