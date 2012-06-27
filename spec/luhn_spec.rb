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

describe CreditCard do
  describe "#==" do
    it "should be equal credit card if number is identical" do
      CreditCard.new(37).should == CreditCard.new(37)
    end
  end

  describe "#valid?" do
    it "should validate credit card number" do
      CreditCard.new(0).should be_valid
    end
  end
end

class Fixnum
  def to_credit_card
    CreditCard.new(self)
  end

  def luhn?
    to_credit_card.valid?
  end
end

describe Fixnum do
  describe "#to_credit_card" do
    it "should convert number to credit card" do
      37.to_credit_card.should == CreditCard.new(37)
    end
  end

  describe "#luhn?" do
    it "should validate credit card number" do
      0.should be_luhn
    end
  end
end