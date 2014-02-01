class FileParser

  def self.parse_file(input)
    input1 = input.split(/Input \d:/).reject{|line| line.empty?}.map{|paragraph| paragraph.split("\n")}
    input2 = input1.collect do |array|
      array.reject do |item|
        item.length <= 1
      end
    end
  end
  
end


