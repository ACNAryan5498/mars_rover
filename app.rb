Dir[__dir__ + '/lib/parsers/*.rb'].each { |file| require file }
Dir[__dir__ + '/lib/models/*.rb'].each { |file| require file }

class App
  def run
    puts "MARS ROVER APP\nInsert input (type ctrl-d when you have done):\n"
    input = []
    STDIN.read.each_line { |line| input << line.delete("\n") }
    plateau = generate_plateau(input.shift)
    puts "\n\nOutput:\n"
    output(input, plateau) until input.empty?
  end

  private

  def generate_plateau(coords_string)
    parser = CoordinatesParser.new(coords_string)
    Plateau.new(parser.coordinates.first, parser.coordinates.last)
  end

  def output(input, plateau)
    rover = deploy_rover(plateau, input.shift)
    instruct_rover(rover, input.shift)
    print_rover_location(rover)
  end

  def deploy_rover(plateau, location_string)
    parser = LocationParser.new(location_string)
    coords = Coordinates.new(parser.coordinates.first, parser.coordinates.last)
    direction = Direction.new(parser.direction)
    Rover.new(plateau, coords, direction)
  end

  def instruct_rover(rover, command_string)
    rover_commands = CommandParser.new(command_string).command_list
    rover_commands.each { |command| command.execute(rover) }
  end

  def print_rover_location(rover)
    puts rover.current_location
  end
end
