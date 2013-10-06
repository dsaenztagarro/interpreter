require 'spec_helper'

describe Grammar do
  describe "#to" do
    let(:grammar) { Grammar.new.apply(@dictionary) }
    before(:all) do
      templates = [
        Template.new("work_at", "work", "<SUBJECT> <VERB> at <PREDICATE>"),
        Template.new("feel", "feel", "<SUBJECT> <VERB> <PREDICATE>"),
        Template.new("shout", "say", "every morning <VERB> '<PREDICATE>'")]
      @dictionary = Dictionary.new(templates)
    end

    context "a singular subject and one sentence" do
      let(:control_information) {
        Hash["who", ["David"], "work_at", ["Redradix"]]
      }
      it "returns a well written sentence" do
        message = "David works at Redradix"
        grammar.analyze(control_information).to_s.should == message
      end
    end
    context "a plural subject and one sentence" do
      let(:control_information) {
        Hash["who", ["David", "Miguel"], "work_at", ["Redradix"]]
      }
      it "returns a well written sentence" do
        message = "David and Miguel work at Redradix"
        grammar.analyze(control_information).to_s.should == message
      end
    end
    context "a singular subject and multiple sentences" do
      let(:control_information) {
        Hash["who", ["David"], "feel", ["awesome", "motivated"],
            "work_at", ["Redradix"], "shout", ["this company rocks!"]]
      }
      it "returns a well written sentence" do
        message = "David works at Redradix " +
          "and s/he feels awesome and motivated " +
          "and every morning says 'this company rocks!'"
        grammar.analyze(control_information).to_s.should == message
      end
    end
    context "a plural subject and multiple sentences" do
      let(:control_information) {
        Hash["who", ["David", "Miguel"], "feel", ["awesome", "motivated"],
            "work_at", ["Redradix"], "shout", ["this company rocks!"]]
      }
      it "returns a well written sentence" do
        message = "David and Miguel work at Redradix " +
          "and they feel awesome and motivated " +
          "and every morning say 'this company rocks!'"
        grammar.analyze(control_information).to_s.should == message
      end
    end
  end
end

