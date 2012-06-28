require 'credit_card'

describe CreditCard do
  describe "#==" do
    it "should be equal credit card if number is identical" do
      CreditCard.new(37).should == CreditCard.new(37)
    end
  end

  describe "#digits" do
    it "should divide number to digits array" do
      CreditCard.new(373).digits.should == [3, 7, 3]
    end
  end

  describe "#double_every_second_digit" do
    it "should double the value of every second digit" do
      CreditCard.new(374).double_every_second_digit.should == 678
    end

    it "should treat the digits independently if a product has two digits" do
      CreditCard.new(8876).double_every_second_digit.should == 816712
    end
  end

  describe "#sum_of_double_every_second_digit" do
    it "should sum double of of every second digit" do
      CreditCard.new(374).sum_of_double_every_second_digit.should == 6 + 7 + 8
    end
  end

  describe "#valid?" do
    it "should validate credit card number" do
      CreditCard.new(0).should be_valid
    end
  end
end