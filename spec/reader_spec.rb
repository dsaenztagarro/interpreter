require 'spec_helper'

describe Reader do
  describe ".new" do
    it "translates a block message to control information format" do
      reader = Reader.read{ who("David", "Miguel").feel("Awesome") }
      reader.output.should include(
        :who => ["David", "Miguel"], :feel => ["Awesome"])
    end
  end
end
