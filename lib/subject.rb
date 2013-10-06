class Subject

  attr_accessor :words

  def initialize(*words)
    @words = ["s/he"]
    @words = Array.new(*words) if not words.nil?
  end

  def plural?
    @words.length > 1
  end

  def to_s(sentence=nil)
    return first_person if not sentence.nil? and sentence.first?
    third_person
  end

  private

  def first_person
    return @words.join(" and ") if not @words.empty?
    "s/he"
  end

  def third_person
    return "they" if plural?
    "s/he"
  end

end
