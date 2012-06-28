require 'ruby_extensions/array'
require 'ostruct'

class CreditCard
  attr_reader :card_number

  DEFAULT_OPTIONS = {check_digit: 0}
  def initialize(card_number, opts={})
    @card_number = card_number
    @options = OpenStruct.new(DEFAULT_OPTIONS.merge(opts))
  end

  def ==(another)
    card_number == another.card_number
  end

  def valid?
    check_digit(sum_of_double_every_second_digit) == @options.check_digit
  end

  def double_every_second_digit
    reversed = to_digits.reverse

    odd = reversed.odd_values
    even = reversed.even_values
    odd = odd.map{|digit| digit * 2}

    doubled = even.interleave(odd).reverse
    doubled.map(&:to_s).join.to_i
  end

  def check_digit(number)
    (10 - (number % 10)) % 10
  end

  def sum_of_double_every_second_digit
    to_digits(double_every_second_digit).inject(:+)
  end

  def to_digits(number = card_number)
    number.to_s.chars.to_a.map(&:to_i)
  end
end