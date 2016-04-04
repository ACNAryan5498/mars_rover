class Rover
  def initialize(plateau, coords, direction)
    raise 'Rover coords outside plateau' unless plateau.contains?(coords)
    @plateau = plateau
    @current_coords = coords
    @current_direction = direction
  end

  def turn_left
    @current_direction = @current_direction.left
  end

  def turn_right
    @current_direction = @current_direction.right
  end

  def move
    coords_after_move = @current_coords.next_coordinates(
      @current_direction.step_for_x_axis,
      @current_direction.step_for_y_axis
    )
    @current_coords = coords_after_move if @plateau.contains?(coords_after_move)
  end

  def current_location
    "#{@current_coords} #{@current_direction}"
  end
end
