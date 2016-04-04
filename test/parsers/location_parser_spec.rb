require 'spec_helper'
require 'parsers/location_parser'

describe LocationParser do
  describe '#direction' do
    it 'is case insensitive' do
      parser1 = LocationParser.new('0 0 N')
      parser2 = LocationParser.new('0 0 n')
      expect(parser1.direction).to eq parser2.direction
    end
    context 'when no string is passed' do
      it 'raise an error' do
        error = 'Direction input not valid'
        parser = LocationParser.new
        expect { parser.direction }.to raise_error error
      end
    end
    context 'when passed N after coords in the string' do
      it 'returns the direction key N' do
        parser = LocationParser.new('0 0 N')
        expect(parser.direction).to eq 'N'
      end
    end
    context 'when passed S after coords in the string' do
      it 'returns the direction key S' do
        parser = LocationParser.new('0 0 S')
        expect(parser.direction).to eq 'S'
      end
    end
    context 'when passed W after coords in the string' do
      it 'returns the direction key W' do
        parser = LocationParser.new('0 0 W')
        expect(parser.direction).to eq 'W'
      end
    end
    context 'when passed E after coords in the string' do
      it 'returns the direction key E' do
        parser = LocationParser.new('0 0 E')
        expect(parser.direction).to eq 'E'
      end
    end
    context 'when passed multiple chars' do
      it 'returns the first valid direction key found after coords' do
        parser = LocationParser.new('rne34 5 gf56wyre e')
        expect(parser.direction).to eq 'W'
      end
      it 'raise an error if it cannot find a valid dir key after coords' do
        error = 'Direction input not valid'
        parser = LocationParser.new('rne34 5 gf5yr')
        expect { parser.direction }.to raise_error error
      end
    end
  end
end
