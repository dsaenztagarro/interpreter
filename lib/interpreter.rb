Dir[File.join(".", "lib/**/*.rb")].each do |f|
  require f
end

##
# This class translate a block message into a String message
#
# Reader and Translator ared loaded using dependency injection
# Reader translates the block message into a system "control information"
# Translator takes the "control information" to build the String message

class Interpreter

  def initialize(reader=Reader, translator=Translator.new, &message)
    @reader = reader
    @translator = translator
    @control_information = @reader.read(&message).output if message
  end

  def output
    @translator.translate(@control_information) if not @control_information.nil?
  end
end
