require 'spec_helper'

describe Translator do
  let(:control_information) {
    { "who" => ["David", "Miguel"], "feel" => ["awesome"]}
  }

  describe "::process" do
    it "returns saves arguments as subject of the phrase" do
      sentence = Translator.new.translate
      sentence.should == "David y Miguel feel awesome"
    end
  end
end
