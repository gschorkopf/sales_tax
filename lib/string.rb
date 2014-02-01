class String

  def exempt?
    exempt_items.any? { |item| self.include?(item) }
  end

  def import?
    imported.any? { |word| self.include?(word) }
  end

  def exempt_items
    ["book", "chocolate", "pills"]
  end

  def imported
    ["import", "imported"]
  end

end

