require 'spec_helper'
require 'models/coordinates'

describe Coordinates do
  subject(:coordinates) { described_class.new(1, 1) }

  describe '#next_coordinates' do
    it 'returns a new instance of coordinates' do
      coords = coordinates.next_coordinates(1, 1)
      expect(coords).not_to equal coordinates
    end
    it 'does not change the original coordinates instance' do
      coordinates.next_coordinates(1, 1)
      expect(coordinates.x).to eq 1
      expect(coordinates.y).to eq 1
    end
    it 'increments x coord for positive step value' do
      coords = coordinates.next_coordinates(1, 0)
      expect(coords.x).to eq 2
    end
    it 'decrements x coord for negative step value' do
      coords = coordinates.next_coordinates(-1, 0)
      expect(coords.x).to eq 0
    end
    it 'increments y coord for positive step value' do
      coords = coordinates.next_coordinates(0, 1)
      expect(coords.y).to eq 2
    end
    it 'decrements y coord for negative step value' do
      coords = coordinates.next_coordinates(0, -1)
      expect(coords.y).to eq 0
    end
  end

  describe '#within_limit' do
    it 'identifies coordinates within the limit' do
      coords_in = described_class.new(0, 0)
      expect(coordinates.within_limit?(coords_in)).to be true
      expect(coordinates.within_limit?(coordinates)).to be true
    end
  end

  describe '#outside_limit' do
    it 'identifies coordinates outside the limit' do
      coords_out = described_class.new(2, 2)
      expect(coordinates.outside_limit?(coords_out)).to be true
      expect(coordinates.outside_limit?(coordinates)).to be true
    end
  end

  describe '#to_s' do
    it 'returns a meaningful string representing coordinates (x y)' do
      expect(coordinates.to_s).to eq '1 1'
    end
  end
end
