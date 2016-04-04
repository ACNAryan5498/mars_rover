require_relative './command'

class MoveCommand < Command
  def initialize
    super('moves the rover forward one grid point maintaining the same heading')
  end

  def execute(rover)
    rover.move
  end
end
