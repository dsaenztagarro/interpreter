##
# This class filters the system "control information" making
# use of the dictionary and build the String message

class Grammar

  def initialize
    @sentences = Array.new
    @templates = Array.new
  end

  def apply(dictionary)
    @templates = dictionary.templates
    return self
  end

  def analyze(control_information)
    subject = fetch_subject(control_information)
    @sentences = fetch_valid_sentences(control_information, subject)
    @sentences[0].first= true if @sentences and not @sentences.empty?
    return self
  end

  def to_s
    @sentences.each { |sentence| sentence.to_s }.join(" and ")
  end

  private

  def fetch_subject(control_information)
    words = control_information[:who]
    words ||= Array.new
    Subject.new(words)
  end

  def fetch_valid_sentences(control_information, subject)
    @templates.collect { |t|
      if control_information.key? t.key.to_sym
        verb = Verb.new(t.verb)
        predicate = Predicate.new(control_information[t.key.to_sym])
        Sentence.new(subject, verb, predicate, t.expression)
      end
    }.compact
  end

end
