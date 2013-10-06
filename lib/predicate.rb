class Predicate

  def initialize(*args)
    @words = Array.new(*args)
  end

  def to_s
    @words.join(" and ")
  end
end
