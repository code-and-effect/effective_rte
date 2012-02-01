# encoding: utf-8
module StylishRte
  module Utils
    class << self
      def escape_single_quotes(str)
        str.gsub('\\','\0\0').gsub('</','<\/').gsub(/\r\n|\n|\r/, "\\n").gsub(/["']/) { |m| "\\#{m}" }
      end

      def parameterize_filename(filename)
        extension = File.extname(filename)
        basename = filename.gsub(/#{extension}$/, "")

        [basename.parameterize('_'), extension].join.downcase
      end

      def js_replace(dom_id, options = {})
        js_options = applay_options(options)

        js = "$('##{dom_id}').htmlarea();"
#        js = ["if (CKEDITOR.instances['#{dom_id}']) {CKEDITOR.remove(CKEDITOR.instances['#{dom_id}']);}"]
#
#        if js_options.blank?
#          js << "CKEDITOR.replace('#{dom_id}');"
#        else
#          js << "CKEDITOR.replace('#{dom_id}', { #{js_options} });"
#        end

#        js.join
      end

      def applay_options(options)
        str = []

        options.each do |key, value|
          item = case value
            when String then
              value.split(//).first == '^' ? value.slice(1..-1) : "'#{value}'"
            when Hash then
              "{ #{applay_options(value)} }"
            when Array then
              arr = value.collect { |v| "'#{v}'" }
              "[ #{arr.join(',')} ]"
            else value
          end

          str << %Q{"#{key}": #{item}}
        end

        str.sort.join(',')
      end
    end
  end
end
