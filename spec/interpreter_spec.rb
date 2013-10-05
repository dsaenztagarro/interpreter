require 'spec_helper'

describe Interpreter do
  describe "#output" do
    context "no block sent in creation" do
      it "returns nil when no phrase is sent to interpreter" do
        Interpreter.new.output.should be_nil
      end
    end
    context "block with one subject and one predicated sent" do
      it "returns a sentence" do
        sentence = Interpreter.new {
          who("David", "Miguel").feel("awesome", "motivated")
        }.output
        sentence.should == "David y Miguel feel awesome and motivated"
      end
    end
  end
end
