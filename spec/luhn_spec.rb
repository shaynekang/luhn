require 'fixnum'

describe "Luhn" do
  it "should validate credit card number" do
    0.should be_luhn
    79927398713.should be_luhn
  end
end