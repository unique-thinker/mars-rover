require 'spec_helper'

describe Directions do
  let(:x) {1}
  let(:y) {2}
  describe '#rotete_90_left' do

    it 'should change command value from N to W' do
      @direction = Directions.new(x: x, y: y, command: :N)
      @direction = @direction.rotete_90_left
      expect(@direction.command).to eq(:W)
    end

    it 'should change command value from E to N' do
      @direction = Directions.new(x: x, y: y, command: :E)
      @direction = @direction.rotete_90_left
      expect(@direction.command).to eq(:N)
    end

    it 'should change command value from S to E' do
      @direction = Directions.new(x: x, y: y, command: :S)
      @direction = @direction.rotete_90_left
      expect(@direction.command).to eq(:E)
    end

    it 'should change command value from S to E' do
      @direction = Directions.new(x: x, y: y, command: :W)
      @direction = @direction.rotete_90_left
      expect(@direction.command).to eq(:S)
    end

    it 'should raise exception when given any other value' do
      @direction = Directions.new(x: x, y: y, command: :Z)
      expect { @direction.rotete_90_left }.to raise_error(KeyError)
    end
  end

  describe '#rotete_90_right' do

    it 'should change command value from N to E' do
      @direction = Directions.new(x: x, y: y, command: :N)
      @direction = @direction.rotete_90_right
      expect(@direction.command).to eq(:E)
    end

    it 'should change command value from E to S' do
      @direction = Directions.new(x: x, y: y, command: :E)
      @direction = @direction.rotete_90_right
      expect(@direction.command).to eq(:S)
    end

    it 'should change command value from S to W' do
      @direction = Directions.new(x: x, y: y, command: :S)
      @direction = @direction.rotete_90_right
      expect(@direction.command).to eq(:W)
    end

    it 'should change command value from W to N' do
      @direction = Directions.new(x: x, y: y, command: :W)
      @direction = @direction.rotete_90_right
      expect(@direction.command).to eq(:N)
    end

    it 'should raise exception when given any other value' do
      @direction = Directions.new(x: x, y: y, command: :P)
      expect { @direction.rotete_90_right }.to raise_error(KeyError)
    end
  end

  describe '#move_in_same_direction' do

    it 'should add 1 in y' do
      @direction = Directions.new(x: x, y: y, command: :N)
      @direction = @direction.move_in_same_direction
      expect(@direction.y).to eq(y+1)
    end

    it 'should add 1 in x' do
      @direction = Directions.new(x: x, y: y, command: :E)
      @direction = @direction.move_in_same_direction
      expect(@direction.y).to eq(x+1)
    end

    it 'should be substract -1 in y' do
      @direction = Directions.new(x: x, y: y, command: :S)
      @direction = @direction.move_in_same_direction
      expect(@direction.y).to eq(y-1)
    end

    it 'should be substract -1 in x' do
      @direction = Directions.new(x: x, y: y, command: :W)
      @direction = @direction.move_in_same_direction
      expect(@direction.x).to eq(x-1)
    end

    it 'should not do any changes when given any other value' do
      @direction = Directions.new(x: x, y: y, command: :P)
      expect(@direction.x).to eq(x)
      expect(@direction.y).to eq(y)
    end
  end
end
