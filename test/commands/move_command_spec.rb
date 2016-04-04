require 'spec_helper'
require 'commands/move_command'

describe MoveCommand do
  let(:rover) { double :rover }
  subject(:move_command) { described_class.new }

  it 'initializes with a custom description' do
    desc = 'moves the rover forward one grid point maintaining the same heading'
    expect(move_command.description).to eq desc
    move_command
  end

  describe '#execute' do
    it 'calls move method on the object passed as argument' do
      expect(rover).to receive(:move)
      move_command.execute(rover)
    end
  end
end
