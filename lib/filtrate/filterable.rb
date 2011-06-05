module Filterable
  def filtered(opts)
    opts ||= {}
    scope = self.scoped
    opts.each do |attr, val|
      if val.kind_of? Hash
        scope = Filtrate::Filter.new(scope, attr, val).to_scope if val['from'].present? && val['to'].present?
      else
        scope = Filtrate::Filter.new(scope, attr, val).to_scope if val.present?
      end
    end
    scope
  end
end