class Subject

  attr_accessor :words

  def initialize(*words)
    @words = Array.new(*words)
    @words = ["s/he"] if words.nil?
  end

  def firstPerson
    @words.join(" and ")
  end

  def thirdPerson
    return "they" if plural?
    return "s/he"
  end

  def plural?
    @words.length > 1
  end

end
