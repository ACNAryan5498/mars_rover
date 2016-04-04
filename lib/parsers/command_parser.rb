Dir[File.expand_path('..', __dir__) + '/commands/*.rb']
  .each { |file| require file }

class CommandParser
  CMD_KEYS = {
    L: TurnLeftCommand,
    R: TurnRightCommand,
    M: MoveCommand
  }.freeze

  def initialize(string = '')
    @buffer = StringScanner.new(string)
    @cmd_list = []
    parse
  end

  def command_list
    @cmd_list.dup
  end

  private

  def parse
    add_cmd_to_list(@buffer.getch.upcase) until @buffer.eos?
  end

  def add_cmd_to_list(char)
    @cmd_list << CMD_KEYS[char.to_sym].new if valid_command_key?(char)
  end

  def valid_command_key?(char)
    CMD_KEYS.keys.include? char.to_sym
  end
end
