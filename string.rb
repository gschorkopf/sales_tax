class String

  def exempt?
    include?("book") || include?("chocolate") || include?("pills")
  end

  def import?
    include?("import")
  end

end
