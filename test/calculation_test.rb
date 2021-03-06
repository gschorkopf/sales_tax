require 'minitest'
require 'minitest/autorun'
require_relative '../lib/calculation.rb'

class CalculationTest < MiniTest::Unit::TestCase
  attr_reader :receipt
  include Calculation


  def test_original_item_and_price
    assert_equal "1 book: 12.49", name_and_price("1 book at 12.49")
    assert_equal "1 music CD: 16.49", name_and_price("1 music CD at 16.49")
    assert_equal "1 chocolate bar: 0.85", name_and_price("1 chocolate bar at 0.85")
    assert_equal "1 imported box of chocolates: 10.00", name_and_price("1 imported box of chocolates at 10.00")
    assert_equal "1 bottle of perfume: 18.99", name_and_price("1 bottle of perfume at 18.99")
    assert_equal "1 packet of headache pills: 9.75", name_and_price("1 packet of headache pills at 9.75")
    assert_equal "1 imported bottle of perfume: 47.50", name_and_price("1 imported bottle of perfume at 47.50")
    assert_equal "1 box of imported chocolates: 11.25", name_and_price("1 box of imported chocolates at 11.25")
  end

  def test_price
    assert_equal 12.49, price("1 book at 12.49")
  end

  def test_sales_tax_for_nonexempt_items_and_nonimport_items
    assert_equal 1.50, sales_tax("1 music CD at 14.99")
  end

  def test_sales_tax_for_exempt_and_nonimport_items
    assert_equal 0, sales_tax("1 packet of headache pills at 9.75")
  end

  def test_sales_tax_for_exempt_and_import_items
    assert_equal 0.6, sales_tax("1 box of imported chocolates at 11.25")
  end

  def test_sales_tax_for_nonexempt_and_import_items
    assert_equal 7.15 , sales_tax("1 imported bottle of perfume at 47.50")
  end

end
