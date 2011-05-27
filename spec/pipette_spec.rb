require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Pipette do
  describe "input and output" do
    it "should have input accessor" do
      BlankPipe.new().should respond_to(:input)
      BlankPipe.should respond_to(:input)
    end

    it "should have output accessor" do
      BlankPipe.new.should respond_to(:output)
    end

    it "should take input from command line like Thor" do
      args = ["two", "--out_from_one", "out.txt", "--out_from_one_2", "out2.txt"]
      content = capture(:stdout) { InputOutputPipe.start(args) }
      content.should == "two\nout.txt\nout2.txt\n"
    end

    it "should set output" do
      args = ["one", "--bam_file", "in.txt"]
      content = capture(:stdout) { InputOutputPipe.start(args) }
      content.should == "one\nin.txt\nout_to_two.txt\n"
    end

    it "should pipe output from previous step to input for next step" do
      args = ["start", "--bam_file", "in_one.txt"]
      content = capture(:stdout) { InputOutputPipe.start(args) }
      content.should == "one\nin_one.txt\nout_to_two.txt\ntwo\nout_to_two.txt\nout2.txt\n"
    end
  end

  describe "additional options" do
    it "should have steps option" do
      BlankPipe.new().should respond_to(:steps)
      args = ["start", "--steps", "one", "two", "three"]
      options = BlankPipe.new().options
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
