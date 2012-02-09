module StylishRte
  module Helpers
    module FormHelper
      extend ActiveSupport::Concern

      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::JavaScriptHelper

      def stylish_rte_text_area(object_name, method, options = {})
        options = { :language => I18n.locale.to_s }.merge(options)

        input_html = (options.delete(:input_html) || {})
        hash = input_html.stringify_keys

        instance_tag = ActionView::Base::InstanceTag.new(object_name, method, self, options.delete(:object))
        instance_tag.send(:add_default_name_and_id, hash)

        options[:target_div] = "asset_frame_for_" + hash['id']

        output_buffer = ActiveSupport::SafeBuffer.new
        output_buffer << instance_tag.to_text_area_tag(input_html)
        output_buffer << javascript_tag(Utils.js_replace(hash['id'], options))

        output_buffer << render(:file => 'stylish_rte/assets/index', :layout => "layouts/asset_frame", :locals => {:target_div => options[:target_div], :htmlarea => hash['id']})
      end
    end
  end
end
