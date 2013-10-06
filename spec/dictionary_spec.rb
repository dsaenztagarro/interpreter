require 'spec_helper'

describe Dictionary do
  describe "#new" do
    it "stores the templates passed" do
      templates = [
        Template.new("work_at", "work", "<SUBJECT> <VERB> at <PREDICATE>"),
        Template.new("feel", "feel", "<SUBJECT> <VERB> <PREDICATE>"),
        Template.new("shout", "say", "every morning <VERB> '<PREDICATE>'")]
      dictionary = Dictionary.new(templates)
      dictionary.templates.length.should be(3)
    end
    it "loads a csv file if isn't passed a template list" do
      dictionary = Dictionary.new
      dictionary.templates.length.should > 0
    end
  end
end
