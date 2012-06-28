require 'credit_card'

describe CreditCard do
  describe "#==" do
    it "should be equal credit card if number is identical" do
      CreditCard.new(37).should == CreditCard.new(37)
    end
  end

  describe "#to_digits" do
    it "should divide number to digits array" do
      CreditCard.new(373).to_digits.should == [3, 7, 3]
    end

    it "should divide custom number to digits array" do
      CreditCard.new(1).to_digits(1124).should == [1, 1, 2, 4]
    end
  end

  describe "#double_every_second_digit" do
    it "should double the value of every second digit" do
      CreditCard.new(334).double_every_second_digit.should == 364
    end

    it "should treat the digits independently if a product has two digits" do
      CreditCard.new(8876).double_every_second_digit.should == 168146
    end
  end

  describe "#sum_of_double_every_second_digit" do
    it "should sum double of of every second digit" do
      CreditCard.new(374).sum_of_double_every_second_digit.should == 3 + 1 + 4 + 4
    end
  end

  describe "#valid?" do
    it "should validate credit card number" do
      CreditCard.new(0).should be_valid
      CreditCard.new(79927398713).should be_valid
    end
  end
end