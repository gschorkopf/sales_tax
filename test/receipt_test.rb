require 'minitest'
require 'minitest/autorun'
require_relative '../lib/receipt.rb'

class ReceiptTest < MiniTest::Unit::TestCase
  attr_reader :r, :input_summary

  def setup
    input = ["1 book at 12.49", 
              "1 music CD at 14.99", 
              "1 chocolate bar at 0.85"]
    @r = Receipt.new(input)
    @input_summary = ["1 book: 12.49", "1 music CD: 16.49", "1 chocolate bar: 0.85"]
  end

  def test_item_totals
    assert [12.49, 16.49, 0.85], r.item_totals
  end

  def test_sales_tax_total
    assert 1.50, r.sales_tax_total
  end

  def test_summary
    assert_equal input_summary, r.summary
  end



end
