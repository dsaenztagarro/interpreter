require 'spec_helper'

describe Verb do
  let(:subject) { subject = double("Subject") }
  let(:verb) { Verb.new "work" }
  it "conjugates the first person" do
    subject.stub(:plural?).and_return(true)
    verb.to_s(subject).should == "work"
  end
  it "conjugates the third person" do
    subject.stub(:plural?).and_return(false)
    verb.to_s(subject).should == "works"
  end
end


