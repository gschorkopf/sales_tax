require_relative './file_parser'
require_relative './file_reader'
require_relative './receipt'

class ReceiptPrinter

  def create_receipts
    input = FileParser.parse_file(FileReader.read_file)
    input.map{ |i| Receipt.new(i)}
  end


end

r = ReceiptPrinter.new
puts r.create_receipts.first.summary
puts r.create_receipts.first.sales_tax_total
puts r.create_receipts.first.subtotal
