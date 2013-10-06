class Sentence

  attr_accessor :subject, :predicate

  def initialize(subject, predicate, template)
    @subject = subject
    @predicate = predicate
    @template = template
  end

  def to_s
    verb = conjugate_verb
    @template.expression.
      gsub("<SUBJECT>", subject.to_s).
      gsub("<VERB>", verb).
      gsub("<PREDICATE>", predicate.to_s)
  end

  private

  def conjugate_verb
    return @template.verb if subject.plural?
    @template.verb + "s"
  end

end
