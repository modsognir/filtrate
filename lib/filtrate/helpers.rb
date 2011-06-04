module Filtrate
  module Helpers
    extend ActiveSupport::Autoload

    autoload :FormHelper, 'filtrate/helpers/form_helper'
    autoload :FilterBuilder, 'filtrate/filter_builder'

    include Filtrate::Helpers::FormHelper
  end
end