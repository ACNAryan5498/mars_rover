class CoordinatesParser
  def initialize(string = '')
    @buffer = StringScanner.new(string)
    @coords = []
    parse
  end

  def coordinates
    raise 'Coordinates input not valid' unless valid_coords_length?
    @coords.dup
  end

  private

  def parse
    until @buffer.eos?
      add_value_to_coords(find_next_digit_string)
      break if valid_coords_length?
    end
  end

  def find_next_digit_string
    @buffer.skip_until(/\D+/) unless @buffer.peek(1) =~ /\d/
    @buffer.scan(/\d+/)
  end

  def add_value_to_coords(digit_string)
    @coords << digit_string.to_i if digit_string
  end

  def valid_coords_length?
    @coords.length == 2
  end
end
