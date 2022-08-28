require_relative './directions'

class Rover

  def initialize(x:, y:, command:)
    x = Integer(x)
    y = Integer(y)
    @dir = Directions.new(x: x, y: y, command: command)
  end

  def start_moving(max_coordinates: [5,5], moves:)
    moves.chars.each do |cmd|
      case cmd.to_sym
      when :M
        @dir.move_in_same_direction
      when :L
        @dir.rotete_90_left
      when :R
        @dir.rotete_90_right
      else
        puts "Invalid direction #{cmd}"
        break;
      end
      check_coordinate_limit(@dir.x, @dir.y, max_coordinates)
    end
    @dir
  end

  private

  def check_coordinate_limit(x, y, max_coordinates)
    if (x < 0 || x > max_coordinates[0] || y < 0 || y > max_coordinates[1])
      raise "Oops! Position can not be beyond bounderies (0,0) and (#{max_coordinates[0]},#{max_coordinates[1]})"
    end
  end
end
