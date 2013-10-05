class Sentence

  attr_accessor :subject, :predicates

  def initialize
    @subject = Array.new
    @predicates = Array.new
  end

  def to_hash
    @structure
  end

end
