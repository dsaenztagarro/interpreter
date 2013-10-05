require 'spec_helper'

describe Reader do
  describe ".new" do
    it "saves the subject of the sentence" do
      reader = Reader.new{ who("David", "Miguel").feel("Awesome") }
      reader.subject.should == ["David", "Miguel"]
    end
  end
end
