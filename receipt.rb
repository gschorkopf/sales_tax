require_relative 'calculation'
require_relative 'file_reader'

class Receipt

  def summary(input)
    c = Calculation.new
    input.collect do |line|
      summary = c.name_and_price(line).split[0..-2].join(" ")
      if c.sales_tax(line) > 0
        total = c.sales_tax(line) + c.price(line)
      else
        total = c.price(line)
      end
      "#{summary} #{total}"
    end
  end

  def sales_tax_total(input)
    c = Calculation.new
    input.collect do |line|
      c.sales_tax(line)
    end.inject(:+)
  end

  def item_totals(input)
    c = Calculation.new
    input.collect do |line|
      if c.sales_tax(line) > 0
        c.sales_tax(line) + c.price(line)
      else
        c.price(line)
      end
    end
  end

  def subtotal(input)
    item_totals(input).collect do |total|
      total
    end.inject(:+)
  end




  # Output 1:
  # 1 book : 12.49
  # 1 music CD: 16.49
  # 1 chocolate bar: 0.85
  # Sales Taxes: 1.50
  # Total: 29.83


end

r = Receipt.new
puts r.summary(FileReader.input)
puts r.sales_tax_total(FileReader.input)
puts r.subtotal(FileReader.input)


