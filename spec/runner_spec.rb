require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'pipette/runner'
ARGV = []
describe Pipette::Runner do
  describe "basic run" do
    it "should output help by default" do
      content = capture(:stdout) { Pipette::Runner.start() }
      help_content = capture(:stdout) {Pipette::Runner.new().help()}
      content.should_not == ""
      content.should =~ /^Options/
      content.should == help_content
    end

    it "should output version info with -v" do
      content = capture(:stdout) { Pipette::Runner.start(["-v"]) }
      version_content = capture(:stdout) { Pipette::Runner.new().version() }
      content.should == version_content
      content.should_not == ""
      version_content.should =~ %r[#{Pipette::VERSION}]
    end
  end
end
