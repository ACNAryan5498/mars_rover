class Direction
  DIR_KEYS = {
    N: { steps: [0, 1],  left: :W, right: :E },
    S: { steps: [0, -1], left: :E, right: :W },
    W: { steps: [-1, 0], left: :S, right: :N },
    E: { steps: [1, 0],  left: :N, right: :S }
  }.freeze

  def initialize(dir_key)
    @dir_key = dir_key.to_sym
  end

  def left
    Direction.new(DIR_KEYS[dir_key][:left])
  end

  def right
    Direction.new(DIR_KEYS[dir_key][:right])
  end

  def step_for_x_axis
    DIR_KEYS[dir_key][:steps].first
  end

  def step_for_y_axis
    DIR_KEYS[dir_key][:steps].last
  end

  def to_s
    dir_key.to_s
  end

  private

  attr_reader :dir_key
end
