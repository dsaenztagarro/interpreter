require 'spec_helper'

describe Subject do
  before(:all) do
    @singular_subject = Subject.new(["David"])
    @plural_subject = Subject.new(["David", "Miguel"])
  end
  describe "#firstPerson" do
    context "A single word" do
      it "returns the single word" do
        @singular_subject.firstPerson.should == "David"
      end
    end
    context "Several words" do
      it "returns the words joined by an 'and'" do
        @plural_subject.firstPerson.should == "David and Miguel"
      end
    end
  end
  describe "#thirdPerson" do
    context "A single word" do
      it "returns the third person" do
        @singular_subject.thirdPerson.should == "s/he"
      end
    end
    context "Several words" do
      it "returns the third person" do
        @plural_subject.thirdPerson.should == "they"
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
