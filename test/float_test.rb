require 'minitest'
require 'minitest/autorun'
require_relative '../lib/float.rb'

class FloatTest < MiniTest::Unit::TestCase

  def test_point_five
    assert_equal 0.6, (0.5625).point_five
    assert_equal 7.15, (7.125).point_five
  end

end
