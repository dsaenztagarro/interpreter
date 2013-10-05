class Translator

  attr_accessor :subject, :predicates

  def initialize(dictionary=Dictionary.new)
    @dictionary = dictionary
  end

  def translate(control_information)
    subject = control_information["who"]
    vs = @dictionary.fetch_valid_sentences(control_information)
    build_output(vs)
  end

  private

  def subject(control_information)
    control_information.key? "who"
  def build_output(sentences)

  end

end
