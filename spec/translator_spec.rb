require 'spec_helper'

describe Translator do
  let(:translator) { Translator.new(@dictionary) }
  let(:control_information) {
    Hash[:who, ["David", "Miguel"], :feel, ["awesome", "motivated"],
        :work_at, ["Redradix"], :shout, ["this company rocks!"]]
  }

  describe "#translate" do
    before(:all) do
      templates = [
        Template.new("work_at", "work", "<SUBJECT> <VERB> at <PREDICATE>"),
        Template.new("feel", "feel", "<SUBJECT> <VERB> <PREDICATE>"),
        Template.new("shout", "say", "every morning <VERB> '<PREDICATE>'")]
      @dictionary = Dictionary.new(templates)
    end
    it "returns a string message" do
      message = "David and Miguel work at Redradix " +
        "and they feel awesome and motivated " +
        "and every morning say 'this company rocks!'"
      translator.translate(control_information).should == message
    end
  end

end
