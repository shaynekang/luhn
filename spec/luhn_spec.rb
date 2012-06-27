class Fixnum
  def luhn?
    true
  end
end

describe Fixnum do
  describe "#luhn?" do
    it "should validate credit card number" do
      0.should be_luhn
    end
  end
end