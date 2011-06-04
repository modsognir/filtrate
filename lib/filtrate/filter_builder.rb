require 'action_view/helpers/form_tag_helper'

module Filtrate
  class FilterBuilder
    include ActionView::Helpers::FormTagHelper

    def filter(attr, name=nil, value="", text_field_opts={})
      label_tag("filters[#{attr}]", (name || attr.to_s.humanize)) + text_field_tag("filters[#{attr}]", value, text_field_opts)
    end
    
    def submit(value="Save changes", options={})
      submit_tag(value, options)
    end
    
    def method_missing(method, *args)
    end
  end
end