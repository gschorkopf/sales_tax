require_relative 'file_reader'

class FileParser

  def self.parse_file(input)
    input.split(/Input \d:/).reject{|line| line.empty?}.map{|paragraph| paragraph.split("\n")}.collect {|array| array[1..-2] }
  end
  
end

