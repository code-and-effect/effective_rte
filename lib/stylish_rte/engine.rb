module StylishRte
  # Required to access the asset pipeline
  # @private
  class Engine < ::Rails::Engine
    initializer 'stylish_rte.initialize' do
      #ActiveSupport.on_load(:action_view) do
      #  include StylishRte::Helpers::FormHelper
      #end
    end
  end
end
