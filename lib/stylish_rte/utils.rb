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
        js_options = jsify_options(options)

        if js_options.blank?
          js = "$('##{dom_id}').htmlarea();"
        else
          js = "$('##{dom_id}').htmlarea({#{js_options}});"
        end
      end

      def jsify_options(options)
        str = []

        options.each do |key, value|
          item = case value
            when String then
              value.split(//).first == '^' ? value.slice(1..-1) : "'#{value}'"
            when Hash then
              "{ #{jsify_options(value)} }"
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
