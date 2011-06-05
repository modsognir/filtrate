require 'action_view/helpers/form_tag_helper'

module Filtrate
  class FilterBuilder
    include ActionView::Helpers::FormTagHelper

    def filter(attr, name=nil, value="", text_field_opts={})
      label_tag("filters[#{attr}]", (name || attr.to_s.humanize)) + text_field_tag("filters[#{attr}]", value, text_field_opts)
    end

    # FIXME: Date field stuff is very messy.
    def filter_date(attr, label_options={}, value="", text_field_options={})
      label_options[:prefix] ||= nil
      label_options[:from] ||= "From"
      label_options[:to] ||= "To"
      [:to, :from].map {|type| date_field_set(type, attr, label_options, value, text_field_options) }.join('').html_safe
    end

    def date_field_set(type, attr, label_options={}, value="", text_field_opts={})
      date_label(type, attr, label_options) + date_field(type, attr, value, text_field_opts)
    end
    
    def date_label(type, attr, opts={})
      label_tag("filters[#{attr}][#{type}]", "#{opts[:prefix]} #{opts[type].try(:humanize)}".strip)
    end
    
    def date_field(type, attr, value, opts)
      text_field_tag("filters[#{attr}][#{type}]", value, opts)
    end
      
    def submit(value="Save changes", options={})
      submit_tag(value, options)
    end
    
    def method_missing(method, *args)
    end
  end
end