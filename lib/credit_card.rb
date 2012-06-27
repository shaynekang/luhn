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
end