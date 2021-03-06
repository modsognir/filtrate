require 'active_record'
require 'active_support'
require 'action_view/helpers'


require 'filtrate/filterable'
require 'filtrate/helpers/form_helper'

module Filtrate
  extend ActiveSupport::Concern
  extend ActiveSupport::Autoload
  
  autoload :Filter, 'filtrate/filter'
  autoload :Filterable, 'filtrate/filterable'
  autoload :FilterBuilder, 'filtrate/filter_builder'
  
  module ClassMethods
    def filterable
      extend Filterable
    end
  end  
end

ActiveRecord::Base.class_eval{ include Filtrate }
ActiveRecord::Relation.class_eval{ include Filterable }
ActionView::Helpers.class_eval{ include Filtrate::Helpers::FormHelper }