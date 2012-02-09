require 'rails'
require 'action_controller'
require 'active_record'

require 'carrierwave'
require 'stylish_rte'

module StylishRte
  # Required to access the asset pipeline
  # @private
  class Engine < ::Rails::Engine
    isolate_namespace StylishRte

    config.generators do |g|
      g.orm :active_record
      g.template_engine :erb
      g.test_framework :rspec
    end

    #config.action_view.javascript_expansions[:ckeditor] = "ckeditor/ckeditor"

    #initializer 'stylish_rte.assets_precompile' do |app|
      # app.config.assets.precompile += StylishRte.assets
    #end

    initializer "stylish_rte.load_app_instance_data" do |app|
      StylishRte.setup do |config|
        config.app_root = app.root
      end
    end

    initializer "stylish_rte.helpers" do
      ActiveSupport.on_load :action_controller do
        ActionController::Base.send :include, StylishRte::Helpers::Controllers
      end

      ActiveSupport.on_load :action_view do
        ActionView::Base.send :include, StylishRte::Helpers::FormHelper
        ActionView::Helpers::FormBuilder.send :include, StylishRte::Helpers::FormBuilder
      end
    end

    initializer 'stylish_rte.hooks' do
      require "stylish_rte/hooks/formtastic" if Object.const_defined?("Formtastic")
    end
  end
end
