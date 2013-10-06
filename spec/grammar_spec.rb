require 'spec_helper'

describe Grammar do
  describe "#to" do
    before(:all) do
      sentences = [
        Sentence.new("work_at", "work", "<SUBJECT> <VERB> at <PREDICATE>"),
        Sentence.new("feel", "feel", "<SUBJECT> <VERB> <PREDICATE>"),
        Sentence.new("shout", "say", "every morning <VERB> '<PREDICATE>'")]
      dictionary = Dictionary.new(sentences)
      @grammar = Grammar.new.apply(dictionary)
    end
    context "a block message with a singular subject and one sentence" do
      let(:control_information) {
        Hash["who", ["David"], "work_at", ["Redradix"]]
      }
      it "returns a well written sentence" do
        sentences = @grammar.to(control_information)
        sentences.should == "David works at Redradix"
      end
    end
  end

  # If this test fails DELETE IT
  describe "." do

  end
=begin
  describe "#fetch_subject" do
    before(:all) do
      @dictionary = Dictionary.new(Array.new)
    end
    context "no subject specified in control information" do
      before(:all) do
        @control_information = Hash.new
      end
      it "returns a third person generic subject" do
        subject = @dictionary.fetch_subject(@control_information)
        subject.writeIn1stPerson.should == "s/he"
      end
    end
    context "singular subject specified in control information" do
      before(:all) do
        @control_information = Hash[:who, ["David"]]
      end
      it "returns the subject when using the first person" do
        subject = @dictionary.fetch_subject(@control_information)
        subject.writeIn1stPerson.should == "s/he"
      end
      it "returns a generic singular subject when using third person" do
        subject = @dictionary.fetch_subject(@control_information)
        subject.writeIn3rdPerson.should == "s/he"
      end
    end
    context "plural subject specified in control information" do
      before(:all) do
        @control_information = Hash[:who, ["David", "Miguel"]]
      end
      it "returns the subject when using the first person" do
        subject = @dictionary.fetch_subject(@control_information)
        subject.writeIn1stPerson.should == "David y Miguel"
      end
      it "returns a generic plural subject when using third person" do
        subject = @dictionary.fetch_subject(@control_information)
        subject.writeIn3rdPerson.should == "they"
      end
    end
  end
=end
end

