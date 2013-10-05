class Sentence

  attr_accessor :subject, :verb, :predicate, :expression

  def initialize(verb, expression)
    @verb = verb
    @expression = expression
  end

end
