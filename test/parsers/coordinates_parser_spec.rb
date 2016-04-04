require 'spec_helper'
require 'parsers/coordinates_parser'

describe CoordinatesParser do
  describe '#coordinates' do
    it 'does not expose the array instance variable returning a duplicate' do
      parser = CoordinatesParser.new('0 0')
      expect(parser.coordinates).not_to equal parser.coordinates
    end
    context 'when no string is passed' do
      it 'raise an error' do
        error = 'Coordinates input not valid'
        parser = CoordinatesParser.new
        expect { parser.coordinates }.to raise_error error
      end
    end
    context 'when the numbers in the string are less than 2' do
      it 'raise an error' do
        error = 'Coordinates input not valid'
        parser = CoordinatesParser.new('hk58fds dfsh')
        expect { parser.coordinates }.to raise_error error
      end
    end
    context 'when passed multiple chars string' do
      it 'returns the first 2 number that can find in the line' do
        parser = CoordinatesParser.new('0 0 34 56')
        expect(parser.coordinates).to eq [0, 0]
      end
      it 'skips not digit chars input' do
        parser = CoordinatesParser.new('r fD80t Ugd7 ddkj34 0')
        expect(parser.coordinates).to eq [80, 7]
      end
    end
  end
end
