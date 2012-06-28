require 'ruby_extensions/array'

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
    reversed = to_digits.reverse

    odd = reversed.odd_values
    even = reversed.even_values
    odd = odd.map{|digit| digit * 2}

    doubled = even.interleave(odd).reverse
    doubled.map(&:to_s).join.to_i
  end

  def sum_of_double_every_second_digit
    to_digits(double_every_second_digit).inject(:+)
  end

  def to_digits(number=@number)
    number.to_s.chars.to_a.map(&:to_i)
  end
end