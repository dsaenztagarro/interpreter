require 'spec_helper'

describe Reader do
  describe "::read" do
    context "a block message with a single sentence" do
      it "translates a block message to control information format" do
        reader = Reader.read{ who("David", "Miguel").feel("Awesome") }
        reader.output.should include(
          :who => ["David", "Miguel"], :feel => ["Awesome"])
      end
    end
    context "a block message with multiple sentences and plural subject" do
      it "returns the control information " do
        reader = Reader.read{ who("David", "Miguel").feel("awesome","motivated").work_at("Redradix").shout("this company rocks!") }
        reader.output.should include(
          :who => ["David", "Miguel"], :feel => ["awesome", "motivated"],
          :work_at => ["Redradix"], :shout => ["this company rocks!"])
      end
    end
  end
end
