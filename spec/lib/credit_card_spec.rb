require 'credit_card'

describe CreditCard do
  def credit_card(card_number, opts={})
    @credit_card ||= CreditCard.new(card_number, opts)
  end

  describe "#==" do
    it "should be equal credit card if number is identical" do
      credit_card(37).should == credit_card(37)
    end
  end

  describe "#to_digits" do
    it "should divide number to digits array" do
      credit_card(373).to_digits.should == [3, 7, 3]
    end

    it "should divide custom number to digits array" do
      credit_card(1).to_digits(1124).should == [1, 1, 2, 4]
    end
  end

  describe "#double_every_second_digit" do
    it "should double the value of every second digit" do
      credit_card(334).double_every_second_digit.should == 364
    end

    it "should treat the digits independently if a product has two digits" do
      credit_card(8876).double_every_second_digit.should == 168146
    end
  end

  describe "#sum_of_double_every_second_digit" do
    it "should sum double of of every second digit" do
      credit_card(374).sum_of_double_every_second_digit.should == 3 + 1 + 4 + 4
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

