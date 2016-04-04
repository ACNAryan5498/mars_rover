require 'spec_helper'
require 'models/direction'

describe Direction do
  let(:north) { described_class.new('N') }
  let(:south) { described_class.new('S') }
  let(:west)  { described_class.new('W') }
  let(:est)   { described_class.new('E') }

  context 'when direction is North (N)' do
    describe '#left' do
      it 'returns a west direction object' do
        expect(north.left.to_s).to eq west.to_s
      end
    end
    describe '#right' do
      it 'returns an est direction object' do
        expect(north.right.to_s).to eq est.to_s
      end
    end
    describe '#step_for_x_axis' do
      it 'is immobile on x axis' do
        expect(north.step_for_x_axis).to eq 0
      end
    end
    describe '#step_for_y_axis' do
      it 'moves one step forward on y axis' do
        expect(north.step_for_y_axis).to eq 1
      end
    end
  end

  context 'when direction is South (S)' do
    describe '#left' do
      it 'returns an est direction object' do
        expect(south.left.to_s).to eq est.to_s
      end
    end
    describe '#right' do
      it 'returns a west direction object' do
        expect(south.right.to_s).to eq west.to_s
      end
    end
    describe '#step_for_x_axis' do
      it 'is immobile on x axis' do
        expect(south.step_for_x_axis).to eq 0
      end
    end
    describe '#step_for_y_axis' do
      it 'moves one step backward on y axis' do
        expect(south.step_for_y_axis).to eq(-1)
      end
    end
  end

  context 'when direction is West (W)' do
    describe '#left' do
      it 'returns a south direction object' do
        expect(west.left.to_s).to eq south.to_s
      end
    end
    describe '#right' do
      it 'returns a north direction object' do
        expect(west.right.to_s).to eq north.to_s
      end
    end
    describe '#step_for_x_axis' do
      it 'moves one step backward on x axis' do
        expect(west.step_for_x_axis).to eq(-1)
      end
    end
    describe '#step_for_y_axis' do
      it 'is immobile on y axis' do
        expect(west.step_for_y_axis).to eq 0
      end
    end
  end

  context 'when direction is Est (E)' do
    describe '#left' do
      it 'returns a north direction object' do
        expect(est.left.to_s).to eq north.to_s
      end
    end
    describe '#right' do
      it 'returns a south direction object' do
        expect(est.right.to_s).to eq south.to_s
      end
    end
    describe '#step_for_x_axis' do
      it 'moves one step forward on x axis' do
        expect(est.step_for_x_axis).to eq 1
      end
    end
    describe '#step_for_y_axis' do
      it 'is immobile on y axis' do
        expect(est.step_for_y_axis).to eq 0
      end
    end
  end

  describe '#to_s' do
    it 'returns a meaningful string representing direction key' do
      expect(north.to_s).to eq 'N'
    end
  end
end
