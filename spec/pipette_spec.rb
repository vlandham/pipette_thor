require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Pipette do
  describe "additional options" do
    it "should have " do
      args = ["start"]
      options = BlankPipe.start(args)
      options.should == {}
    end
  end

  describe "#steps" do
    it "should have steps when provided" do
      BasicPipe.new().steps.should == [:one, :two, :three]
    end
    it "should have empty steps when not provided" do
      BlankPipe.new().steps.should == []
    end
  end
end
