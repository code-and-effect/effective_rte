require 'rails/generators'
require 'rails/generators/migration'

module StylishRte
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      desc 'Generate migration for Asset models'

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def self.next_migration_number(dirname)
        Time.now.strftime("%Y%m%d%H%M%S")
      end

      # Copy our configuration file
      def copy_initializer
        template "stylish_rte.rb", "config/initializers/stylish_rte.rb"
      end

      def mount_engine
        route "mount StylishRte::Engine => '/stylish_rte'"
      end

#      def create_model
#        [:asset].each do |filename|
#          template "models/#{filename}.rb", File.join("app/models/stylish_rte", "#{filename}.rb")
#        end
#
#        template "uploaders/stylish_rte_asset_uploader.rb", File.join("app/uploaders", "stylish_rte_asset_uploader.rb")
#      end

      def create_migration
        migration_template "../../../../db/migrate/01_create_stylish_rte_assets.rb", File.join('db/migrate', 'create_stylish_rte_assets.rb')
      end

    end
  end
end
