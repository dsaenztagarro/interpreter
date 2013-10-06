class Translator

  def initialize(dictionary=Dictionary.new, grammar=Grammar.new)
    @dictionary = dictionary
    @grammar = grammar
  end

  def translate(control_information)
    sentences = @grammar.apply(@dictionary).to(control_information)
    sentences.map { |sentence| sentence.to_s }.join
  end

end
