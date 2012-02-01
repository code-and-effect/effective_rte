module StylishRte
  module Helpers
    module Controllers
      extend ActiveSupport::Concern

      protected

        def stylish_rte_authenticate
          return true
        end
    end
  end
end
