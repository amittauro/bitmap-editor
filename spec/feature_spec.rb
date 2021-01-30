require './lib/bitmap_editor'
require './lib/command'
require './lib/instruction'
require './lib/input'

describe 'feature' do
  before(:each) do
    allow_any_instance_of(String).to receive(:colorize).and_return('o')
  end
  let(:bitmapeditor) { BitmapEditor.new }
  it 'can show a 2 x 2 image' do
    allow(bitmapeditor).to receive(:gets).and_return('I 2 2', 'S', 'X')
    expect { bitmapeditor.run }.to output(/x x\nx x/).to_stdout
  end

  it 'can colour one pixel' do
    allow(bitmapeditor).to receive(:gets).and_return('I 2 2', 'L 0 0 red', 'S', 'X')
    expect { bitmapeditor.run }.to output(/o x\nx x/).to_stdout
  end

  it 'can colour a vertical segment' do
    allow(bitmapeditor).to receive(:gets).and_return('I 2 2', 'V 0 0 1 red', 'S', 'X')
    expect { bitmapeditor.run }.to output(/o x\no x/).to_stdout
  end

  it 'can colour a horizontal segment' do
    allow(bitmapeditor).to receive(:gets).and_return('I 2 2', 'H 0 1 1 red', 'S', 'X')
    expect { bitmapeditor.run }.to output(/x x\no o/).to_stdout
  end
end
