require 'spec_helper'

describe Subject do
  before(:all) do
    @singular_subject = Subject.new(["David"])
    @plural_subject = Subject.new(["David", "Miguel"])
  end
  describe "::new" do
    it "returns a generic subject when it is not supplied a word" do
      sentence = double("Sentence")
      sentence.stub(:first?).and_return(true)
      subject = Subject.new
      subject.to_s(sentence).should == "s/he"
    end
  end
  describe "#to_s" do
    context "the subject belongs to the first sentence of the message" do
      let(:sentence) { double('Sentence') }
      it "returns a single word" do
        sentence.stub(:first?).and_return(true)
        @singular_subject.to_s(sentence).should == "David"
      end
      it "returns several words joined by an 'and'" do
        sentence.stub(:first?).and_return(true)
        @plural_subject.to_s(sentence).should == "David and Miguel"
      end
    end
    context "the subject doesnt belong to the first sentence of the message" do
      let(:sentence) { double('Sentence') }
      it "returns the correct pronoun for a single subject" do
        sentence.stub(:first?).and_return(false)
        @singular_subject.to_s(sentence).should == "s/he"
      end
      it "returns the correct pronoun for a plural subject" do
        sentence.stub(:first?).and_return(false)
        @plural_subject.to_s(sentence).should == "they"
      end
    end
  end
  describe "#plural?" do
    context "A single word" do
      it "returns false" do
        @singular_subject.plural?.should be false
      end
    end
    context "Several words" do
      it "returns true" do
        @plural_subject.plural?.should be true
      end
    end
  end
end
