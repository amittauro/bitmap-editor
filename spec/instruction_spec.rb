require_relative '../app/lib/instruction.rb'

describe Instruction do
  subject(:instruction) { described_class.new(command) }

  describe '.parse' do
    context 'when parsing different inputs' do
      it 'returns an array for I 2 2' do
        instruction = Instruction.new
        expect(instruction.parse('I 2 2')).to eq(['I','2','2'])
      end
    end
  end

  describe '.execute' do
    context 'when executing different commands' do
      let(:x) { 2 }
      let(:y) { 2 }
      let(:command) { double('command') }

      it 'asks command object to create image' do
        instruction.parse("I #{x} #{y}")
        expect(command).to receive(:create).with(x, y)
        instruction.execute
      end

      it 'asks command object to show image' do
        binding.pry
        command = double('command')
        instruction = Instruction.new(command)
        instruction.parse('S')
        expect(command).to receive(:show)
        instruction.execute
      end

      it 'asks command object to colour pixel with colour C' do
        command = double('command')
        instruction = Instruction.new(command)
        instruction.parse('L 1 1 blue')
        expect(command).to receive(:colour_pixel).with(1, 1, 'blue')
        instruction.execute
      end

      it 'asks command object to draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive)' do
        command = double('command')
        instruction = Instruction.new(command)
        instruction.parse('V 1 0 1 blue')
        expect(command).to receive(:vertical_segment).with(1, 0, 1, 'blue')
        instruction.execute
      end

      it 'asks command object to draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive)' do
        command = double('command')
        instruction = Instruction.new(command)
        instruction.parse('H 1 0 1 blue')
        expect(command).to receive(:horizontal_segment).with(1, 0, 1, 'blue')
        instruction.execute
      end
    end
  end
end
