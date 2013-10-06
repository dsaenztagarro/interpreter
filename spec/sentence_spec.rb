require 'spec_helper'

describe Sentence do
  describe "#to_s" do
    let(:sentence) { Sentence.new(subject, verb, predicate, expression) }
    let(:verb) { Verb.new "feel" }
    let(:expression) { "<SUBJECT> <VERB> <PREDICATE>" }

    context "first sentence of the message" do
      before(:each) do
        sentence.first = true
      end

      context "a singular subject" do
        let(:subject) { Subject.new ["David"] }

        context "a singular predicate" do
          let(:predicate) { Predicate.new ["awesome"] }

          it "returns the correct message" do
            sentence.to_s.should == "David feels awesome"
          end
        end
        context "a plural predicate" do
          let(:predicate) { Predicate.new ["awesome", "motivated"] }

          it "returns the correct message" do
            sentence.to_s.should == "David feels awesome and motivated"
          end
        end
      end
      context "a plural subject" do
        let(:subject) { Subject.new ["David", "Miguel"] }

        context "a singular predicate" do
          let(:predicate) { Predicate.new ["awesome"] }

          it "returns the correct message" do
            sentence.to_s.should == "David and Miguel feel awesome"
          end
        end
        context "a plural predicate" do
          let(:predicate) { Predicate.new ["awesome", "motivated"] }

          it "returns the correct message" do
            sentence.to_s.should == "David and Miguel feel awesome and motivated"
          end
        end
      end
    end
    context "not the first sentence of the message" do
      before(:each) do
        sentence.first = false
      end

      context "a singular subject" do
        let(:subject) { Subject.new ["David"] }

        context "a singular predicate" do
          let(:predicate) { Predicate.new ["awesome"] }

          it "returns the correct message" do
            sentence.to_s.should == "s/he feels awesome"
          end
        end
        context "a plural predicate" do
          let(:predicate) { Predicate.new ["awesome", "motivated"] }

          it "returns the correct message" do
            sentence.to_s.should == "s/he feels awesome and motivated"
          end
        end
      end
      context "a plural subject" do
        let(:subject) { Subject.new ["David", "Miguel"] }

        context "a singular predicate" do
          let(:predicate) { Predicate.new ["awesome"] }

          it "returns the correct message" do
            sentence.to_s.should == "they feel awesome"
          end
        end
        context "a plural predicate" do
          let(:predicate) { Predicate.new ["awesome", "motivated"] }

          it "returns the correct message" do
            sentence.to_s.should == "they feel awesome and motivated"
          end
        end
      end
    end
  end
end
