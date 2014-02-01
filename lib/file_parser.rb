class FileParser

  def self.parse_file(input)
    single_string_inputs = split_and_remove_empty_strings(input)
    inputs_separate = split_array_and_remove_line_breaks(single_string_inputs)
    remove_empty_strings_within_arrays(inputs_separate)
  end

  private

  def self.split_and_remove_empty_strings(input)
    input.split(/Input \d:/).reject{|line| line.empty?}
  end

  def self.split_array_and_remove_line_breaks(input)
    input.map{|paragraph| paragraph.split("\n")}
  end

  def self.remove_empty_strings_within_arrays(input)
    input.collect do |array|
      array.reject {|item| item.length <= 1 }
    end
  end

end


