require 'spec_helper'
require 'fixnum'

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