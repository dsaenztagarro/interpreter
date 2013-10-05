require 'spec_helper'

describe Interpreter do
  describe "#output" do
    context "when no block message is passed" do
      it "returns nil" do
        Interpreter.new.output.should be_nil
      end
    end
    context "when a block message is passed" do
      it "returns a string representation of the message" do
        sentence = Interpreter.new{
          who("David", "Miguel").feel("awesome", "motivated")
        }.output
        sentence.should == "David y Miguel feel awesome and motivated"
      end
    end
  end
end
