require_relative 'calculation'

class Receipt
  attr_reader :input
  include Calculation

  def initialize(input)
    @input = input
  end

  def summary
    input.collect do |line|
      summary = name_and_price(line).split[0..-2].join(" ")
      total = (sales_tax(line) + price(line)).round(2)

      "#{summary} #{total}"
    end
  end

  def sales_tax_total
    input.collect { |line| (sales_tax(line)) }.inject(:+)
  end

  def item_totals
    input.collect {|item| sales_tax(item) + price(item)}
  end

  def subtotal
    item_totals.inject(:+)
  end

end




