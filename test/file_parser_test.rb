require 'minitest'
require 'minitest/autorun'
require_relative '../lib/file_parser.rb'

class FileParserTest < MiniTest::Unit::TestCase

  def test_parse_file
    assert_equal result, FileParser.parse_file("Input 1:\n1 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85\n \nInput 2:\n1 imported box of chocolates at 10.00\n1 imported bottle of perfume at 47.50\n \nInput 3:\n1 imported bottle of perfume at 27.99\n1 bottle of perfume at 18.99\n1 packet of headache pills at 9.75\n1 box of imported chocolates at 11.25\n")
  end

  def result
    [
      ["1 book at 12.49", 
        "1 music CD at 14.99", 
        "1 chocolate bar at 0.85"], 
      ["1 imported box of chocolates at 10.00", 
        "1 imported bottle of perfume at 47.50"], 
      ["1 imported bottle of perfume at 27.99", 
        "1 bottle of perfume at 18.99", 
        "1 packet of headache pills at 9.75", 
        "1 box of imported chocolates at 11.25"]
    ] 
  end



end
