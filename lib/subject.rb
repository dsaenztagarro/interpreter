class Subject

  attr_accessor :words

  def initialize(*words)
    @words = Array.new(*words)
    @words = ["s/he"] if words.nil?
  end

  def plural?
    @words.length > 1
  end

  def to_s(sentence)
    return first_person if sentence.first?
    third_person
  end

  private

  def first_person
    @words.join(" and ")
  end

  def third_person
    return "they" if plural?
    return "s/he"
  end

end
