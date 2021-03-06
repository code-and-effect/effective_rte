require "formtastic"

class EffectiveRteInput
  include ::Formtastic::Inputs::Base

  def to_html
    input_wrapping do
      label_html <<
      builder.effective_rte_text_area(method, input_html_options)
    end
  end
end
