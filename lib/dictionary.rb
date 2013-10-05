require 'csv'

class Dictionary

  def initialize
    load_csv
  end

  def fetch_valid_sentences(control_information)
    list = Array.new
    @sentences.each |s| do
      if control_information.key? s.verb
        s.predicates = control_information[s.verb]
        list << s
      end
    end
    list
  end

  private

  def load_csv
    @sentences = Array.new
    s = CSV.readlines(File.expand_path('../dictionary.csv', File.dirname(__FILE__)))
    s.each do |row|
      @sentences << Sentence.new(row[0], row[1])
    end
  end

end
