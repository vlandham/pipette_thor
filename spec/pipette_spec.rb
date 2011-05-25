require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Pipette do
  describe "additional options" do
    it "should have " do
      args = ["start"]
      options = Pipe.start(args)
      options.should == {}
    end
  end

  describe "#steps" do
    it "should add " do
    end
  end
end
