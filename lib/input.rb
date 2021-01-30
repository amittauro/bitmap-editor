class Input

  def initialize(input)
    @input = input
  end

  def read
    convert_to_correct_format
  end

  private
  attr_reader :input

  def parse
    input.split(/[ ]/)
  end

  def convert_to_correct_format
    if input.size == 2
      result = parse.map { |value| value.to_i }
    elsif input.size > 2
      result = parse.map_with_index do |value, index|
        if index < parse.size - 1
          value.to_i
        else
          value.to_sym
        end
      end
    end
    result[1..-1]
  end
end
