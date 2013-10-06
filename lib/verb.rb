class Verb

  def initialize(word)
    @word = word
  end

  def to_s(subject)
    return @word if subject.plural?
    @word + "s"
  end

end
