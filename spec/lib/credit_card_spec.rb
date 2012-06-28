require 'spec_helper'
require 'credit_card'

describe CreditCard do
  def credit_card(card_number, opts={})
    CreditCard.new(card_number, opts)
  end

  describe "#==" do
    it "should be equal if number is identical" do
      credit_card(37).should == credit_card(37)
    end

    it "should be equal if number and check_digit are identical" do
      credit_card(37, check_digit: 3).should == credit_card(37, check_digit: 3)
    end
  end

  describe "#check_digit" do
    it "should return check digit of credit card" do
      credit_card(12345).check_digit.should == 0
      credit_card(12345, check_digit: 5).check_digit.should == 5
    end
  end

  describe "#valid?" do
    it "should validate credit card number" do
      credit_card(79927398713).should be_valid
    end

    it "should validate with custom check digit" do
      credit_card(79927499723, check_digit: 4).should be_valid
    end
  end

  subject { credit_card(0) }

  describe "#double_every_second_digit" do
    it "should double the value of every second digit" do
      subject.double_every_second_digit(334).should == "3#{3*2}4".to_i
    end

    it "should treat the digits independently if a product has two digits" do
      subject.double_every_second_digit(8876).should == "#{8*2}8#{7*2}6".to_i
    end
  end

  describe "#sum_digits" do
    it "should sum every digits" do
      subject.sum_digits(374).should == 3 + 7 + 4
    end
  end

  describe "#calculate_check_digit" do
    it "should return calculated check digit" do
      subject.calculate_check_digit(46).should == (50 - 46) % 10
      subject.calculate_check_digit(50).should == (60 - 50) % 10
    end
  end
end

