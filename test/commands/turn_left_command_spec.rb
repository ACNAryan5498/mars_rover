require 'spec_helper'
require 'commands/turn_left_command'

describe TurnLeftCommand do
  let(:rover) { double :rover }
  subject(:turn_left_command) { described_class.new }

  it 'initializes with a custom description' do
    desc = 'makes the rover spin 90 degrees left'
    expect(turn_left_command.description).to eq desc
  end

  describe '#execute' do
    it 'calls turn left method on the object passed as argument' do
      expect(rover).to receive(:turn_left)
      turn_left_command.execute(rover)
    end
  end
end
