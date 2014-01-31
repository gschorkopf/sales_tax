require_relative 'calculation'
require_relative 'file_reader'
require_relative 'file_parser'

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
        total = sales_tax(line) + price(line)
      else
        total = price(line)
      end
      "#{summary} #{total}"
    end
  end

  def sales_tax_total
    input.collect do |line|
      sales_tax(line)
    end.inject(:+)
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




  # Output 1:
  # 1 book : 12.49
  # 1 music CD: 16.49
  # 1 chocolate bar: 0.85
  # Sales Taxes: 1.50
  # Total: 29.83


end




