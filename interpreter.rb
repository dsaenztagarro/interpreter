class Interpreter

  def initialize(reader=Reader, translator=Translator.new, &message)
    @reader = reader
    @translator = translator
    @control_information = @reader.read(&message).output if message
  end

  def output
    @translator.translate(@control_information) if @control_information
  end
end
