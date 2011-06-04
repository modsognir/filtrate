module Filtrate
  module Helpers
    module FormHelper
      def filtrate(url_for_options = {}, options = {}, *parameters_for_url, &block)
        builder = Filtrate::FilterBuilder.new
        builder.send(:include, ActionView::Helpers::FormTagHelper)
        form_tag(url_for_options, options.merge({:method => :get}), *parameters_for_url) do
          yield builder
        end
      end
    end
  end
end