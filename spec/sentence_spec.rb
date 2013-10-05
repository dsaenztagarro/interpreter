require 'spec_helper'

describe Sentence do
  let(:sentence) { Sentence.new }

  describe "#who" do
    it "saves arguments as subject of the phrase" do
      sentence.who("David", "Miguel")
      sentence.subject.should include(["David", "Miguel"])
    end
  end

  describe "#feel" do
    it "saves arguments as subject of the phrase" do
      sentence.feel("awesome", "motivated")
      sentence.predicates.should include(["awesome", "motivated"])
    end
  end
end
