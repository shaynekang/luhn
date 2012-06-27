require 'credit_card'

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