require_relative './coordinates_parser'

class LocationParser < CoordinatesParser
  DIRECTION_KEYS = %w(N S W E).freeze

  def initialize(string = '')
    super(string)
  end

  def direction
    raise 'Direction input not valid' unless valid_direction_key?
    dir_key
  end

  private

  attr_reader :dir_key

  def parse
    super
    parse_direction
  end

  def parse_direction
    until buffer.eos?
      @dir_key = buffer.getch.upcase
      break if valid_direction_key?
    end
  end

  def valid_direction_key?
    DIRECTION_KEYS.include? dir_key
  end
end
