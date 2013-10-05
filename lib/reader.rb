class Reader

  class << self
    def read(&message)
      self.new.instance_eval(&message)
    end
  end

  def initialize
    @@sentence = Hash.new
  end

  def method_missing(method_id, *args, &block)
    @@sentence[method_id] = args
    self
  end

  def output
    @@sentence
  end

end

