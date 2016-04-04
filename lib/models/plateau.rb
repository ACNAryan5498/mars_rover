class Plateau
  def initialize(top_x, top_y, coordinates_klass = Coordinates)
    @bottom_left_coords = coordinates_klass.new(0, 0)
    @top_right_coords = coordinates_klass.new(top_x, top_y)
  end

  def contains?(coords)
    @bottom_left_coords.outside_limit?(coords) &&
      @top_right_coords.within_limit?(coords)
  end
end
