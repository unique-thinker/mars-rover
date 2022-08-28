require_relative './argument_validation'
require_relative './directions'
require_relative './rover'
require 'optparse'


options = {}
OptionParser.new do |opt|
  opt.on('--first_args FIRSTARGS') { |o| options[:first_args] = o }
  opt.on('--second_args LASTARGS') { |o| options[:second_args] = o }
end.parse!
x, y, command = options[:first_args].split(' ')
command = command.to_sym
ArgumentValidation.is_integer!(x)
ArgumentValidation.is_integer!(y)
ArgumentValidation.is_valid_command!(command.upcase)

moves = options[:second_args].upcase
ArgumentValidation.is_valid_coordinate!(moves)

rover = Rover.new(x: x, y: y, command: command)
location = rover.start_moving(moves: moves)

puts "Output => #{location.x} #{location.y} #{location.command}"
