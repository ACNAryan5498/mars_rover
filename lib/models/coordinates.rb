class Coordinates
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def next_coordinates(x_step_value, y_step_value)
    Coordinates.new(@x + x_step_value, @y + y_step_value)
  end

  def within_limit?(coords)
    x_within_limit?(coords.x) && y_within_limit?(coords.y)
  end

  def outside_limit?(coords)
    x_outside_limit?(coords.x) && y_outside_limit?(coords.y)
  end

  def to_s
    "#{@x} #{@y}"
  end

  private

  def x_within_limit?(x)
    x <= @x
  end

  def y_within_limit?(y)
    y <= @y
  end

  def x_outside_limit?(x)
    x >= @x
  end

  def y_outside_limit?(y)
    y >= @y
  end
end
