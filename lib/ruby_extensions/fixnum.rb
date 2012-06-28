class Fixnum
  def to_digits
    self.to_s.chars.to_a.map(&:to_i)
  end
end