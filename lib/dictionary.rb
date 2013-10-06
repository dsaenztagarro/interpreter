require 'csv'

class Dictionary

  attr_reader :templates

  def initialize(templates=nil)
    @templates = templates
    load_csv if not @templates
  end

  private

  def load_csv
    filePath = File.expand_path('../dictionary.csv', File.dirname(__FILE__))
    @templates = CSV.readlines(filePath)
    @templates.collect! do |row|
      Template.new(row[0], row[1], row[2])
    end
  end

end
