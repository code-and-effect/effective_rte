require 'pathname'

module StylishRte

  autoload :Utils, 'stylish_rte/utils'

  module Helpers
    autoload :ViewHelper, 'stylish_rte/helpers/view_helper'
    autoload :FormHelper, 'stylish_rte/helpers/form_helper'
    autoload :FormBuilder, 'stylish_rte/helpers/form_builder'
    autoload :Controllers, 'stylish_rte/helpers/controllers'
  end

  def self.root_path
    @root_path ||= Pathname.new( File.dirname(File.expand_path('../', __FILE__)) )
  end

  def self.assets
    Dir[root_path.join('vendor/assets/javascripts/stylish_rte/**', '*.{js,css,png}')].inject([]) do |list, path|
      list << Pathname.new(path).relative_path_from(root_path.join('vendor/assets/javascripts'))
    end
  end

end

require 'stylish_rte/engine' if defined?(::Rails)
