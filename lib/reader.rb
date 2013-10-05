require './lib/sentence'

class Reader

  attr_reader :sentence

#  class << self
#
#    def my_new
#      instance = allocate
#      instance.my_initialize()
#      instance
#    end
#
#    def read(&block)
#      self.my_new.instance_eval(&block)
#    end
#  end
#
#  def my_initialize()
#    @sentence = Sentence.new
#  end

  def initialize(&block)
    #self.class.read &block
    self.class.allocate.instance_eval(&block)
  end

  def who *args
    puts "Who called", args
    @@subject = args
    self
  end

  def subject
    @@subject
  end

  def feel *args
    puts "Feel called", args
    self
  end

end

