require_relative './file_parser'
require_relative './file_reader'
require_relative './receipt'

class ReceiptPrinter

  def create_receipts
    input = FileParser.parse_file(FileReader.read_file)
    input.map{ |i| Receipt.new(i)}
  end

  def print_formatted_receipt
    create_receipts.each do |output|
      output.summary.each do |summary|
        File.open("output.txt", "a+"){|f| f << "#{summary}\n" }
      end
      File.open("output.txt", "a+"){|f| f << "Sales Taxes: #{output.sales_tax_total}\nTotal: #{output.subtotal}\n\n" }
    end
  end


end

r = ReceiptPrinter.new
puts r.print_formatted_receipt

