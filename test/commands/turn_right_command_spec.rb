require 'spec_helper'
require 'commands/turn_right_command'

describe TurnRightCommand do
  let(:rover) { double :rover }
  subject(:turn_right_command) { described_class.new }

  it 'initializes with a custom description' do
    desc = 'makes the rover spin 90 degrees right'
    expect(turn_right_command.description).to eq desc
  end

  describe '#execute' do
    it 'calls turn right method on the object passed as argument' do
      expect(rover).to receive(:turn_right)
      turn_right_command.execute(rover)
    end
  end
end
