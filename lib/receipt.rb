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
      if sales_tax(line) > 0
        total = (sales_tax(line) + price(line)).round(2)
      else
        total = (price(line)).round(2)
      end
      "#{summary} #{total}"
    end
  end

  def sales_tax_total
    input.collect { |line| (sales_tax(line)) }.inject(:+)
  end

  def item_totals
    input.collect do |line|
      if sales_tax(line) > 0
        sales_tax(line) + price(line)
      else
        price(line)
      end
    end
  end

  def subtotal
    item_totals.inject(:+)
  end

end




