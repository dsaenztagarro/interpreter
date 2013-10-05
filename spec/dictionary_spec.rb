require 'spec_helper'

describe Dictionary do
  let(:dictionary) { Dictionary.new() }

  describe "#filter" do
    it "returns a hash containing only the known words" do
      valid_words = dictionary.filter(Hash["jump", 5, "drive", 20, "shout", 2])
      valid_words.should_not have_key("drive")
      valid_words.should_not have_key("jump")
      valid_words.should have_key("shout")
    end
  end
end

