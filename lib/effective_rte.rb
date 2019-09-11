require 'pathname'
require 'effective_rte/version'

module EffectiveRte

  autoload :Utils, 'effective_rte/utils'

  module Helpers
    autoload :ViewHelper, 'effective_rte/helpers/view_helper'
    autoload :FormHelper, 'effective_rte/helpers/form_helper'
    autoload :FormBuilder, 'effective_rte/helpers/form_builder'
  end

end

require 'effective_rte/engine' if defined?(::Rails)
