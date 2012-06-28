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

  COMPARISON_ATTRIBUTE = [:card_number, :check_digit]
  def ==(another)
    COMPARISON_ATTRIBUTE.all?{|attr| self.send(attr) == another.send(attr)}
  end

  def check_digit
    options.check_digit
  end

  def valid?
    doubled = double_every_second_digit(card_number)
    summed = sum_digits(doubled)
    checked = calculate_check_digit(summed)

    checked == options.check_digit
  end

  def double_every_second_digit(number)
    reversed = number.to_digits.reverse

    odd = reversed.odd_values
    even = reversed.even_values
    odd = odd.map{|digit| digit * 2}

    doubled = even.interleave(odd).reverse
    doubled.map(&:to_s).join.to_i
  end

  def sum_digits(number)
    number.to_digits.inject(:+)
  end

  def calculate_check_digit(number)
    (10 - (number % 10)) % 10
  end
end