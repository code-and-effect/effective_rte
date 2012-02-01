require 'pathname'

module StylishRte

  autoload :Utils, 'stylish_rte/utils'

  module Helpers
    autoload :ViewHelper, 'stylish_rte/helpers/view_helper'
    autoload :FormHelper, 'stylish_rte/helpers/form_helper'
    autoload :FormBuilder, 'stylish_rte/helpers/form_builder'
    autoload :Controllers, 'stylish_rte/helpers/controllers'
  end

end

require 'stylish_rte/engine' if defined?(::Rails)
