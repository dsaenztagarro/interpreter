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
        message = "Alejandro and Alej work at Redradix " +
          "and they feel awesome and motivated " +
          "and every morning say 'this company rocks!'"
        Interpreter.new{
          who("Alejandro", "Alej").feel("awesome", "motivated").work_at("Redradix").shout("this company rocks!")
        }.output.should == message
      end
    end
    context "when a block message is passed" do
      it "returns a string representation of the message" do
        message = "Juan works at Redradix " +
          "and s/he feels awesome and motivated " +
          "and every morning says 'this company rocks!'"
        Interpreter.new{
          who("Juan").feel("awesome", "motivated").work_at("Redradix").shout("this company rocks!")
        }.output.should == message
      end
    end
  end
end
