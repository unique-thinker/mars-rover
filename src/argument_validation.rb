require_relative './directions'

class ArgumentValidation
  class << self
    def is_integer!(int)
      Integer(int)
    end

    def is_valid_coordinate!(str)
      str.chars.each do |cmd|
        result = %w[L M R].include?(cmd)
        raise StandardError.new("Invalid arguments #{str}") unless result
      end
      str
    end

    def is_valid_command!(word)
      result = Directions::RIGHT.keys.include?(word)
      raise StandardError.new("Invalid arguments #{word}") unless result
      word
    end
  end
end
