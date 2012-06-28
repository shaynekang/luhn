class CreditCard
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def ==(another)
    number == another.number
  end

  def valid?
    true
  end

  def double_every_second_digit
    doubled = []
    digits.reverse.each_slice(2){|digits| doubled << [digits[0] * 2, digits[1]]}
    doubled.flatten.reverse.delete_if(&:nil?).map(&:to_s).join.to_i
  end

  def sum_of_double_every_second_digit
    digits(double_every_second_digit).inject(:+)
  end

  def digits(number=@number)
    number.to_s.chars.to_a.map(&:to_i)
  end
end