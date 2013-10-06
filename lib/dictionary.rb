require 'csv'

class Dictionary

  attr_reader :sentences

  def initialize(sentences)
    @sentences = sentences
    load_csv if not @sentences
  end

  private

  def load_csv
    filePath = File.expand_path('../dictionary.csv', File.dirname(__FILE__))
    @sentences = CSV.readlines(filePath)
    @sentences.collect! do |row|
      Sentence.new(row[0], row[1], row[2])
    end
  end

end
