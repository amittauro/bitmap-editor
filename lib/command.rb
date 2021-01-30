require 'colorize'

class Command

  def initialize()
    @image = Array.new
  end

  def run(input)
    run_suitable_command_based_on_input(parse(input))
  end

  private
  attr_reader :image

  def parse(input)
    input.split(/[ ]/)
  end

  def run_suitable_command_based_on_input(input)
    command = input[0]
    case command
    when 'I'
      create(input[1].to_i, input[2].to_i)
    when 'S'
      show
    when 'L'
      colour_pixel(input[1].to_i, input[2].to_i, input[3].to_sym)
    when 'V'
      vertical_segment(input[1].to_i, input[2].to_i, input[3].to_i, input[4].to_sym)
    when 'H'
      horizontal_segment(input[1].to_i, input[2].to_i, input[3].to_i, input[4].to_sym)
    when 'C'
      clear
    end
  end

  def create(m, n)
    # -> Image.new
    n.times do
      image.push(Array.new(m, 'x'))
    end
  end

  def show
    # @display.print(@image.clone)
    image.map { |pixel| pixel.join(" ") }.each do |row|
      puts row
    end
  end

  def colour_pixel(x, y, colour)
    image[x][y] = 'x'.colorize(colour)
  end

  def vertical_segment(x, y1, y2, colour)
    (y1..y2).each do |n|
      image[n][x] = 'x'.colorize(colour)
    end
  end

  def horizontal_segment(x1, x2, y, colour)
    (x1..x2).each do |n|
      image[y][n] = 'x'.colorize(colour)
    end
  end

  def clear
    image = []
  end


end
