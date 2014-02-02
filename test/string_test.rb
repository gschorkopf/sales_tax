require 'minitest'
require 'minitest/autorun'
require_relative '../lib/string.rb'

class StringTest < MiniTest::Unit::TestCase

  def test_exempt?
    assert "1 book at 12.49".exempt?
    assert "1 chocolate bar at 0.85".exempt?
    assert "1 packet of headache pills at 9.75".exempt?
    refute "1 music CD at 14.99".exempt?
    refute "1 imported bottle of perfume at 47.50".exempt?
  end

  def test_import?
    assert "1 imported bottle of perfume at 47.50".import?
    assert " box of imported chocolates at 11.25".import?
    refute "1 book at 12.49".import?
    refute "1 packet of headache pills at 9.75".import?
  end

end
