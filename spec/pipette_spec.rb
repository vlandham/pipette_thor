require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Pipette do
  describe "additional options" do
    it "should have steps option" do
      #BlankPipe.tasks.keys.should == ["start"]
      args = ["start", "--steps", "one", "two", "three"]
      options = BlankPipe.start(args)
      #options.should == {"steps" => ["one", "two", "three"]}
    end
  end

  describe "#steps" do
    it "should have steps when provided" do
      BasicPipe.new().steps.should == [:one, :two, :three]
    end

    it "should have empty steps when not provided" do
      BlankPipe.new().steps.should == []
    end

    it "should list all steps as valid by default" do
      BasicPipe.new().valid_steps.should == [:one, :two, :three]
    end

    it "should invoke all steps by default" do
      args = ["start"]
      content = capture(:stdout) { BasicPipe.start(args) }
      content.should == "one\ntwo\nthree\n"
    end

    it "should limit steps if --steps option provided" do
      args = ["start", "--steps", "one"]
      content = capture(:stdout) { BasicPipe.start(args) }
      content.should == "one\n"
      args << "two"
      content = capture(:stdout) { BasicPipe.start(args) }
      content.should == "one\ntwo\n"
      args << "three"
      content = capture(:stdout) { BasicPipe.start(args) }
      content.should == "one\ntwo\nthree\n"
    end

    it "should limit steps even from the middle" do
      args = ["start", "--steps", "two"]
      content = capture(:stdout) { BasicPipe.start(args) }
      content.should == "two\n"
      args << "three"
      content = capture(:stdout) { BasicPipe.start(args) }
      content.should == "two\nthree\n"
    end

    it "should limit steps even out of order" do
      args = ["start", "--steps", "two", "one", "three"]
      content = capture(:stdout) { BasicPipe.start(args) }
      content.should == "one\ntwo\nthree\n"
      args = ["start", "--steps", "three", "two", "one"]
      content = capture(:stdout) { BasicPipe.start(args) }
      content.should == "one\ntwo\nthree\n"
    end
  end
end
