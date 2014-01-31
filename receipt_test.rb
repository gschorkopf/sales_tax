require 'minitest'
require 'minitest/autorun'
require_relative 'receipt.rb'
require_relative 'calculation.rb'

class ReceiptTest < MiniTest::Unit::TestCase
  attr_reader :receipt, :calculation

  def setup
    @receipt = Receipt.new
    @calculation = Calculation.new
  end

  def test_original_item_and_price
    assert_equal "1 book: 12.49", calculation.name_and_price("1 book at 12.49")
    assert_equal "1 music CD: 16.49", calculation.name_and_price("1 music CD at 16.49")
    assert_equal "1 chocolate bar: 0.85", calculation.name_and_price("1 chocolate bar at 0.85")
    assert_equal "1 imported box of chocolates: 10.00", calculation.name_and_price("1 imported box of chocolates at 10.00")
    assert_equal "1 bottle of perfume: 18.99", calculation.name_and_price("1 bottle of perfume at 18.99")
    assert_equal "1 packet of headache pills: 9.75", calculation.name_and_price("1 packet of headache pills at 9.75")
    assert_equal "1 imported bottle of perfume: 47.50", calculation.name_and_price("1 imported bottle of perfume at 47.50")
    assert_equal "1 box of imported chocolates: 11.25", calculation.name_and_price("1 box of imported chocolates at 11.25")
  end

  def test_price
    assert_equal 12.49, calculation.price("1 book at 12.49")
  end

  def test_basic_sales_tax_for_non_exempt_items_and_non_import_items
    assert_equal 1.499, calculation.sales_tax("1 music CD at 14.99")
  end

  def test_basic_sales_tax_for_exempt_items
    assert_equal 0, calculation.sales_tax("1 packet of headache pills at 9.75")
  end

  def test_sales_tax_for_exempt_import_items
    assert_equal 1.125, calculation.sales_tax("1 box of imported chocolates at 11.25")
  end

  def test_sales_tax_for_non_exempt_import_items
    assert_equal true, "1 imported bottle of perfume at 47.50".import?
    assert_equal false, "1 imported bottle of perfume at 47.50".exempt?
    assert_equal 7.125 , calculation.sales_tax("1 imported bottle of perfume at 47.50")
  end

end