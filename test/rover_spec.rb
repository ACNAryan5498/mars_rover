require 'spec_helper'
require 'rover'

describe Rover do
  let(:plateau_mock) { double :plateau, contains?: true }
  let(:coords_mock) { double :coordinates, to_s: '1 1' }
  let(:direction_mock) { double :direction, to_s: 'N' }
  let(:direction_mock_aux) { double :direction }
  before do
    allow(direction_mock).to receive(:step_for_x_axis)
    allow(direction_mock).to receive(:step_for_y_axis)
    allow(direction_mock).to receive(:left) { direction_mock_aux }
    allow(direction_mock).to receive(:right) { direction_mock_aux }
  end

  subject(:rover) do
    described_class.new(plateau_mock, coords_mock, direction_mock)
  end

  describe '#initialize' do
    it 'raise an error if coords are outside plateau' do
      allow(plateau_mock).to receive(:contains?) { false }
      expect { rover }.to raise_error 'Rover coords outside plateau'
    end
  end

  describe '#turn_left' do
    it 'overwrite current direction with the left one returned' do
      allow(direction_mock_aux).to receive(:to_s) { 'W' }
      rover.turn_left
      expect(rover.current_location).to eq '1 1 W'
    end
  end

  describe '#turn_right' do
    it 'overwrite current direction with the right one returned' do
      allow(direction_mock_aux).to receive(:to_s) { 'E' }
      rover.turn_right
      expect(rover.current_location).to eq '1 1 E'
    end
  end

  describe '#move' do
    it 'calls the current coords next coordinates method' do
      expect(coords_mock).to receive(:next_coordinates)
      rover.move
    end
    context 'if coordinates after move are inside plateau' do
      it 'change the current coords with the one calculated (rover moves)' do
        allow(coords_mock).to receive(:next_coordinates) { '0 1' }
        rover.move
        expect(rover.current_location).to eq '0 1 N'
      end
    end
    context 'if coordinates after move are outside plateau' do
      it 'keeps the current coordinates (rover does not move)' do
        allow(coords_mock).to receive(:next_coordinates) { '-1 -1' }
        allow(plateau_mock).to receive(:contains?).with('-1 -1') { false }
        rover.move
        expect(rover.current_location).to eq '1 1 N'
      end
    end
  end

  describe '#current_location' do
    it 'returns a string representing the rover location (x y dir)' do
      expect(rover.current_location).to eq '1 1 N'
    end
  end
end
