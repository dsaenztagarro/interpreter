class Grammar

  def initialize
    @sentences = Array.new
    @templates = Array.new
  end

  def apply(dictionary)
    @templates = dictionary.templates
    return self
  end

  def analize(control_information)
    subject = fetch_subject(control_information)
    @sentences = fetch_valid_sentences(control_information, subject)
    @sentences[0].first = true if @sentences
    return self
  end

  def to_s
    @sentences.each { |sentence| sentence.to_s }.join(" and ")
  end

  private

  def fetch_subject(control_information)
    Subject.new(control_information[:who])
  end

  def fetch_valid_sentences(control_information, subject)
    @templates.collect { |t|
      if control_information.key? t.verb
        predicate = control_information[t.verb]
        Sentence.new(subject, predicate, template)
      end
    }.compact
  end

end
