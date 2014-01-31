require_relative 'string'

module Calculation

  def name_and_price(items_and_values)
    items_and_values.gsub(" at", ":")
  end

  def price(item_and_value)
    item_and_value.split.last.to_f
  end

  def sales_tax(item_and_value)
    if exempt_and_import?(item_and_value)
      price(item_and_value) * 0.1
    elsif nonexempt_and_import?(item_and_value)
      price(item_and_value) * 0.15
    elsif exempt_and_nonimport?(item_and_value)
      0
    elsif nonexempt_and_nonimport?(item_and_value)
      price(item_and_value) * 0.10
    else
      price(item_and_value) * 0.05
    end
  end

  private

  def exempt_and_import?(item_and_value)
    item_and_value.exempt? && item_and_value.import?
  end

  def nonexempt_and_import?(item_and_value)
    !item_and_value.exempt? && item_and_value.import?
  end

  def exempt_and_nonimport?(item_and_value)
    item_and_value.exempt? && !item_and_value.import?
  end

  def nonexempt_and_nonimport?(item_and_value)
    !item_and_value.exempt? && !item_and_value.import?
  end

end



