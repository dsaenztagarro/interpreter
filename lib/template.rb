class Template

  attr_reader :key, :verb, :expression

  def initialize(key, verb, expression)
    @key = key
    @verb = verb
    @expression = expression
  end

end
