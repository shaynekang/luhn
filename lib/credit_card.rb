require 'ostruct'
require 'ruby_extensions/array'
require 'ruby_extensions/fixnum'

class CreditCard
  attr_reader :card_number, :options

  DEFAULT_OPTIONS = {check_digit: 0}
  def initialize(card_number, opts={})
    @card_number = card_number
    @options = OpenStruct.new(DEFAULT_OPTIONS.merge(opts))
  end

  def ==(another)
    equal_card_number = (card_number == another.card_number)
    equal_check_digit = (options.check_digit == another.options.check_digit)

    equal_card_number and equal_check_digit
  end

  def double_every_second_digit(number)
    reversed = number.to_digits.reverse

    odd = reversed.odd_values
    even = reversed.even_values
    odd = odd.map{|digit| digit * 2}

    doubled = even.interleave(odd).reverse
    doubled.map(&:to_s).join.to_i
  end

  def sum_of_digit(number)
    number.to_digits.inject(:+)
  end

  def check_digit(number)
    (10 - (number % 10)) % 10
  end

  def valid?
    doubled = double_every_second_digit(card_number)
    summed = sum_of_digit(doubled)
    checked = check_digit(summed)

    checked == options.check_digit
  end
end