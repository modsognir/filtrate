require 'arel'

module Filtrate
  class Filter
    def initialize(scope, attr, val)
      @scope = scope
      @attr = attr
      @value = val
      @type = @scope.columns_hash[attr].try(:type)
      @col = @scope.table[attr]
    end
    
    def to_scope
      case @type
      when :string
        @scope.where(@col.matches("%#{@value}%"))
      when :date
        @scope.where(@attr => @value['from']..@value['to'])
      else
        @scope
      end
    end
  end
end