class Translator

  def initialize(dictionary=Dictionary.new, grammar=Grammar.new)
    @dictionary = dictionary
    @grammar = grammar
  end

  def translate(control_information)
    @grammar.apply(@dictionary).analyze(control_information).to_s
  end

end
