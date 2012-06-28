require 'spec_helper'
require 'ruby_extensions/array'

describe Array do
  describe "#odd_values" do
    it "should return odd values of array" do
      [1, 2, 3, 4, 5].odd_values.should == [2, 4]
    end
  end

  describe "#even_values" do
    it "should return even values of array" do
      [1, 2, 3, 4, 5].even_values.should == [1, 3, 5]
    end
  end

  describe "#interleave" do
    it "should interleave two array" do
      [1, 3, 5].interleave([2, 4]).should == [1, 2, 3, 4, 5]
    end
  end
end