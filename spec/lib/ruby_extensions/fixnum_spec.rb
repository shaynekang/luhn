require 'spec_helper'
require 'ruby_extensions/fixnum'

describe Fixnum do
  describe "#to_digits" do
    it "should divide number to array" do
      12345.to_digits.should == [1, 2, 3, 4, 5]
    end
  end
end