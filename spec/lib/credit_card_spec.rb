require 'credit_card'

describe CreditCard do
  def credit_card(card_number, opts={})
    CreditCard.new(card_number, opts)
  end

  describe "#==" do
    it "should be equal credit card if number is identical" do
      credit_card(37).should == credit_card(37)
    end

    it "should be equal credit card if number and check_digit are identical" do
      credit_card(37, check_digit: 3).should == credit_card(37, check_digit: 3)
    end
  end

  describe "#double_every_second_digit" do
    it "should double the value of every second digit" do
      credit_card(0).double_every_second_digit(334).should == 364
    end

    it "should treat the digits independently if a product has two digits" do
      credit_card(0).double_every_second_digit(8876).should == 168146
    end
  end

  describe "#sum_of_digit" do
    it "should sum of every digit" do
      credit_card(0).sum_of_digit(374).should == 3 + 7 + 4
    end
  end

  describe "#valid?" do
    it "should validate credit card number" do
      credit_card(0).should be_valid
      credit_card(79927398713).should be_valid
    end

    it "should validate with custom check digit" do
      credit_card(79927499723, check_digit: 4).should be_valid
    end
  end

  describe "#check_digit" do
    it "should return calculated check digit" do
      credit_card(0).check_digit(46).should == 4
      credit_card(0).check_digit(50).should == 0
    end
  end
end

