module Filterable
  def filtered(opts)
    puts opts.inspect
    opts ||= {}
    scope = self.scoped
    opts.each do |attr, val|
      scope = filter_attr(scope, attr, val) || scope
    end
    scope
  end
  
  def filter_attr(scope, attr, val)
    if col = self.columns_hash[attr]
      case col.type
      when :string
        scope.where(scope.table[attr].matches("%#{val}%"))
      else
        scope
      end
    else
      scope
    end
  end
end