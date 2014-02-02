require_relative './file_parser'
require_relative './file_reader'
require_relative './receipt'

class ReceiptPrinter

  def create_receipts
    input = FileParser.parse_file(FileReader.read_file)
    input.map{ |i| Receipt.new(i)}
  end

  def print_formatted_receipt
    File.delete("output.txt") if File.exists?("output.txt")
    counter = 1
    create_receipts.each do |output|
        File.open("output.txt", "a+"){|f| f << "Output #{counter}:\n" }
        output.summary.each do |summary|
        File.open("output.txt", "a+"){|f| f << "#{summary}\n" }
      end
      File.open("output.txt", "a+"){|f| f << "Sales Taxes: #{(output.sales_tax_total).round(2)}\nTotal: #{(output.subtotal).round(2)}\n\n" }
      counter += 1
    end
  end

end

r = ReceiptPrinter.new
r.print_formatted_receipt

