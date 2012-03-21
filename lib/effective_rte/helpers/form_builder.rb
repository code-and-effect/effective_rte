require 'yaml'

module EffectiveRte
  module Helpers
    module FormBuilder
      extend ActiveSupport::Concern

      def effective_rte_text_area(method, options = {})
        @template.send("effective_rte_text_area", @object_name, method, objectify_options(options))
      end
    end
  end
end
