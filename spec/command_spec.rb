require_relative '../app/lib/command'
# betterspecs.org
describe Command do
  let!(:command) = Command.new

  describe '.create' do
    context 'when creating an image' do
      it 'can store a 2 by 2 image' do

        expect(@command.create(2, 2)).to eq(
          [['x','x'],
          ['x','x']])
      end
    end
  end

  describe '.show' do
    it 'shows a 2 by 2 image' do
      @command.create(2, 2)
      expect { @command.show }.to output("x x\nx x\n").to_stdout
    end
  end

  describe '.colour_pixel' do
    it 'colours a certain pixel' do
      @command.create(2, 2)
      expect(@command.colour_pixel(1, 1, 'blue')).to eq(
        [['x','x'], ['x','\e[0;34;49mx\e[0m']])
    end
  end

  describe '.vertical_segment' do
    it 'colours a vertical segment' do
      @command.create(2, 2)
      expect(@command.vertical_segment(1, 0, 1, 'blue')).to eq(
        [['x','\e[0;34;49mx\e[0m'],
        ['x','\e[0;34;49mx\e[0m']])
    end
  end

  describe '.horizontal_segment' do
    it 'colours a vertical segment' do
      @command.create(2, 2)
      expect(@command.horizontal_segment(0, 1, 1, 'blue')).to eq(
        [['x','x'],
        ['\e[0;34;49mx\e[0m', '\e[0;34;49mx\e[0m']])
    end
  end
end
