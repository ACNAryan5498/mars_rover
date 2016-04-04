require 'spec_helper'
require 'parsers/command_parser'

describe CommandParser do
  describe '#command_list' do
    it 'does not expose the array instance variable returning a duplicate' do
      parser = CommandParser.new('L')
      expect(parser.command_list).not_to equal parser.command_list
    end
    it 'is case insensitive' do
      parser1 = CommandParser.new('L')
      parser2 = CommandParser.new('l')
      expect(parser1.command_list.first.class)
        .to eq parser2.command_list.first.class
    end
    context 'when no string is passed' do
      it 'returns an empty array' do
        parser = CommandParser.new
        expect(parser.command_list).to be_empty
      end
    end
    context 'when passed L as a string' do
      it 'returns an array with an instance of TurnLeftCommand' do
        parser = CommandParser.new('L')
        expect(parser.command_list.first).to be_kind_of TurnLeftCommand
      end
    end
    context 'when passed R as a string' do
      it 'returns an array with an instance of RightLeftCommand' do
        parser = CommandParser.new('R')
        expect(parser.command_list.first).to be_kind_of TurnRightCommand
      end
    end
    context 'when passed M as a string' do
      it 'returns an array with an instance of MoveCommand' do
        parser = CommandParser.new('M')
        expect(parser.command_list.first).to be_kind_of MoveCommand
      end
    end
    context 'when passed multiple chars' do
      it 'returns an array of commands in order' do
        parser = CommandParser.new('LRM')
        expect(parser.command_list[0]).to be_kind_of TurnLeftCommand
        expect(parser.command_list[1]).to be_kind_of TurnRightCommand
        expect(parser.command_list[2]).to be_kind_of MoveCommand
      end
      it 'skips not valid char input' do
        parser = CommandParser.new('L&%$R*)-M')
        expect(parser.command_list.length).to eq 3
      end
    end
  end
end
