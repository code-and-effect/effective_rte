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
          :assetDialogUrl => '/admin/assets',
          :skin => 'effective',
          :wymPath => '/assets/wymeditor/jquery.wymeditor.js',
          :jQueryPath => 'https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js',
          :iframeBasePath => '/assets/wymeditor/iframe/effective/',
          :logoHtml => '',
          :updateSelector => 'form',
          :updateEvent => 'submit',

          :classesItems => "[
            {'name' : 'carousel', 'title': 'PARA: Carousel', 'expr': 'p'},
            {'name' : 'align-left', 'title': 'IMG: Align Left', 'expr': 'img'},
            {'name' : 'align-right', 'title': 'IMG: Align Right', 'expr': 'img'}
          ]",

          :toolsItems => "[
              {'name': 'Bold', 'title': 'Strong', 'css': 'wym_tools_strong'},
              {'name': 'Italic', 'title': 'Emphasis', 'css': 'wym_tools_emphasis'},
              {'name': 'CreateLink', 'title': 'Link', 'css': 'wym_tools_link'},
              {'name': 'Unlink', 'title': 'Unlink', 'css': 'wym_tools_unlink'},
              {'name': 'LineBreak', 'title': 'Line_Break', 'css': 'wym_tools_line_break'},
              {'name': 'InsertTable', 'title': 'Table', 'css': 'wym_tools_table'},
              {'name': 'Paste', 'title': 'Paste_From_Word', 'css': 'wym_tools_paste'},
              {'name': 'InsertOrderedList', 'title': 'Ordered_List', 'css': 'wym_tools_ordered_list'},
              {'name': 'InsertUnorderedList', 'title': 'Unordered_List', 'css': 'wym_tools_unordered_list'},
              {'name': 'Indent', 'title': 'Indent', 'css': 'wym_tools_indent'},
              {'name': 'Outdent', 'title': 'Outdent', 'css': 'wym_tools_outdent'},
              {'name': 'Undo', 'title': 'Undo', 'css': 'wym_tools_undo'},
              {'name': 'Redo', 'title': 'Redo', 'css': 'wym_tools_redo'},
              {'name': 'ToggleHtml', 'title': 'HTML', 'css': 'wym_tools_html'}
          ]"
        }

        output_buffer = ActiveSupport::SafeBuffer.new
        output_buffer << instance_tag.to_text_area_tag(options)
        output_buffer << (render :partial => 'effective_rte/editor', :locals => {:dom_id => hash['id'], :opts => javascript_options})
      end
    end
  end
end
