class Instruction
  # COMMANDS = {
  #   'I' => Command::CreateImage
  # }

  def initialize(command = Command.new)
    @command = command
  end

  def parse(input)
    @input = input.split(/[ ]/)
  end

  def execute
    command = @input[0]
    # COMMANDS[command].new(???)
    case command
    when 'I'
      # Command::CreateImage.new(**@input[1..-1])
      @command.create(@input[1].to_i, @input[2].to_i)
    when 'S'
      @command.show
    when 'L'
      @command.colour_pixel(@input[1].to_i, @input[2].to_i, @input[3])
    when 'V'
      @command.vertical_segment(@input[1].to_i, @input[2].to_i,
        @input[3].to_i, @input[4])
    when 'H'
      @command.horizontal_segment(@input[1].to_i, @input[2].to_i,
        @input[3].to_i, @input[4])
    when 'C'
      @command.clear
    end
  end

  private
  attr_reader :command, :input
end
