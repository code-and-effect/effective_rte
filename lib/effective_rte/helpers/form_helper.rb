module EffectiveRte
  module Helpers
    module FormHelper
      extend ActiveSupport::Concern

      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::JavaScriptHelper

      def effective_rte_text_area(object_name, method, options = {})
        options = { :language => I18n.locale.to_s }.merge(options)

        input_html = (options.delete(:input_html) || {})
        hash = input_html.stringify_keys

        instance_tag = ActionView::Base::InstanceTag.new(object_name, method, self, options.delete(:object))
        instance_tag.send(:add_default_name_and_id, hash)

        javascript_options = {
          :skin => "default",
          :wymPath => "/assets/wymeditor/jquery.wymeditor.js",
          :jQueryPath => "/assets/jquery.js",
          :assetDialogUrl => "/admin/assets",
          :updateSelector => "[type=submit]",
          :editorStyles => "[{'name': '.carousel', 'css': 'color: red; border: 2px solid #ccc;'}]",
          :classesItems => "[{'name' : 'carousel', 'title': 'PARA: Carousel', 'expr': 'p'}]"
        }

        output_buffer = ActiveSupport::SafeBuffer.new
        output_buffer << instance_tag.to_text_area_tag(options)
        output_buffer << (render :partial => 'effective_rte/editor', :locals => {:dom_id => hash['id'], :opts => javascript_options})
      end
    end
  end
end
