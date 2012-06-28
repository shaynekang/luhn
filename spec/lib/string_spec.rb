require 'spec_helper'
require 'string'

describe String do
  describe "#luhn?" do
    it "should validate credit card number" do
      "0".should be_luhn
    end
  end
end