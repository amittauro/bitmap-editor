require_relative '../app/bitmap_editor'

describe BitmapEditor do
  describe '.run' do
    context 'image creation' do
      it 'shows a 2x2 by image' do
        bitmapeditor = BitmapEditor.new
        allow(bitmapeditor).to receive(:gets).and_return('I 2 2', 'S', 'X')
        expect { bitmapeditor.run }.to output("type ? for help\n> > x x\nx x\n> goodbye!\n").to_stdout
      end
    end
  end
end
