require_relative './command'

class TurnRightCommand < Command
  def initialize
    super('makes the rover spin 90 degrees right')
  end

  def execute(rover)
    rover.turn_right
  end
end
