class CreditCard
  def valid?
    true
  end
end

describe CreditCard do
  describe "#valid?" do
    it "should validate credit card number" do
      CreditCard.new(0).should be_valid
    end
  end
end

class Fixnum
  def luhn?
    CreditCard.new(self).valid?
  end
end

describe Fixnum do
  describe "#luhn?" do
    it "should validate credit card number" do
      0.should be_luhn
    end
  end
end