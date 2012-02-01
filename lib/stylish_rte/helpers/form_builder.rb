module StylishRte
  module Helpers
    module FormBuilder
      extend ActiveSupport::Concern

      def stylish_rte_text_area(method, options = {})
        @template.send("stylish_rte_text_area", @object_name, method, objectify_options(options))
      end
    end
  end
end
