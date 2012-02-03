# encoding: utf-8
module StylishRte
  module Utils
    class << self
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
