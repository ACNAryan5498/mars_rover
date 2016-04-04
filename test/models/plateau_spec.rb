require 'spec_helper'
require 'models/plateau'

describe Plateau do
  let(:coords) { double :coordinates }
  let(:bottom_left_coords) { double :coordinates }
  let(:top_right_coords) { double :coordinates }

  let(:coordinates_klass_mock) { double :Coordinates }
  before do
    allow(coordinates_klass_mock)
      .to receive(:new).with(0, 0) { bottom_left_coords }
    allow(coordinates_klass_mock)
      .to receive(:new).with(5, 5) { top_right_coords }
  end

  subject(:plateau) { described_class.new(5, 5, coordinates_klass_mock) }

  describe '#contains?' do
    it 'identifies coordinates inside plateau' do
      allow(bottom_left_coords).to receive(:outside_limit?) { true }
      allow(top_right_coords).to receive(:within_limit?)    { true }
      expect(plateau.contains?(coords)).to be true
    end
    it 'identifies negative coordinates outside plateau' do
      allow(bottom_left_coords).to receive(:outside_limit?) { false }
      allow(top_right_coords).to receive(:within_limit?)    { true }
      expect(plateau.contains?(coords)).to be false
    end
    it 'identifies positive coordinates outside plateau' do
      allow(bottom_left_coords).to receive(:outside_limit?) { true }
      allow(top_right_coords).to receive(:within_limit?)    { false }
      expect(plateau.contains?(coords)).to be false
    end
  end
end
