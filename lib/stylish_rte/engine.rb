require 'rails'
require 'action_controller'
require 'active_record'

require 'stylish_rte'

module StylishRte
  # Required to access the asset pipeline
  # @private
  class Engine < ::Rails::Engine
    isolate_namespace StylishRte

    initializer "stylish_rte.helpers" do
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
