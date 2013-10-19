##
# This class translates the system "control information" into a String message
#
# A dictionary an grammar objects are loaded using dependency injection
# The dictionary sets the domain specific "commands" that are known by the
# program. The grammar object filter the system "control information" making
# use of the dictionary and build the String message

class Translator

  def initialize(dictionary=Dictionary.new, grammar=Grammar.new)
    @dictionary = dictionary
    @grammar = grammar
  end

  def translate(control_information)
    @grammar.apply(@dictionary).analyze(control_information).to_s
  end

end
