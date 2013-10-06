require 'spec_helper'

describe Sentence do
  describe "#to_s" do
    let(:sentence) { Sentence.new(subject, @predicate, @template) }
    before(:all) do
      @predicate = Predicate.new ["Redradix"]
      @template = Template.new("work_at", "work", "<SUBJECT> <VERB> at <PREDICATE>") }
    end
    context "The first sentence of the message with a singular subject" do
      let(:subject) { Subject.new ["David"] }
      it "returns the correct message" do
        sentence.to_s.should == "David works at Redradix"
      end
    end
  end
end
