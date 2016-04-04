require_relative './command'

class TurnLeftCommand < Command
  def initialize
    super('makes the rover spin 90 degrees left')
  end

  def execute(rover)
    rover.turn_left
  end
end
