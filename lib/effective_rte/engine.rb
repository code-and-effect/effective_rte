require 'rails'
require 'action_controller'
require 'active_record'

require 'effective_rte'

module EffectiveRte
  # Required to access the asset pipeline
  # @private
  class Engine < ::Rails::Engine
    isolate_namespace EffectiveRte

    initializer "effective_rte.helpers" do
      ActiveSupport.on_load :action_view do
        ActionView::Base.send :include, EffectiveRte::Helpers::FormHelper
        ActionView::Helpers::FormBuilder.send :include, EffectiveRte::Helpers::FormBuilder
      end
    end

    initializer 'effective_rte.hooks' do
      require "effective_rte/hooks/formtastic" if Object.const_defined?("Formtastic")
    end
  end
end
