class Sentence

  attr_writer :first

  def initialize(subject, verb, predicate, expression, first=false)
    @subject = subject
    @verb = verb
    @predicate = predicate
    @expression = expression
    @first = first
  end

  def first?
    @first
  end

  def to_s
    @expression.
      gsub("<SUBJECT>", @subject.to_s(self)).
      gsub("<VERB>", @verb.to_s(@subject)).
      gsub("<PREDICATE>", @predicate.to_s)
  end

end
