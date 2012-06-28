class Array
  def odd_values
    self.values_at(*self.each_index.select {|i| i.odd?})
  end

  def even_values
    self.values_at(*self.each_index.select {|i| i.even?})
  end

  def interleave(other)
    max_length = [self, other].map(&:size).max
    Array.new(max_length).zip(self, other).flatten.delete_if(&:nil?)
  end
end