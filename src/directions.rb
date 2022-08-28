class Directions
  attr_reader :x, :y, :command

  LEFT = { N: :W, E: :N, S: :E, W: :S }.freeze
  RIGHT = { N: :E, E: :S, S: :W, W: :N }.freeze

  def initialize(x:, y:, command:)
    self.x = x
    self.y = y
    self.command = command
  end

  def rotete_90_left
    self.command = LEFT.fetch(command)
    self
  end

  def rotete_90_right
    self.command = RIGHT.fetch(command)
    self
  end

  def move_in_same_direction
    case self.command
    when :N
      self.y += 1
    when :E
      self.x += 1
    when :S
      self.y -= 1
    when :W
      self.x -= 1
    end
    self
  end

  private
  attr_writer :x, :y, :command
end
