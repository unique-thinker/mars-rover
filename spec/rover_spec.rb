require 'spec_helper'

describe Rover do
  let(:x) {1}
  let(:y) {2}
  let(:command) { :N }
  let(:moves) { 'MLR' }
  describe '#start_moving' do
    before do
      @rover = Rover.new(x: x, y: y, command: command)
    end

    it 'should add 1 in y' do
      @direction = @rover.start_moving(moves: moves[0])
      expect(@direction.y).to eq(y+1)
      expect(@direction.x).to eq(x)
      expect(@direction.command).to eq(command)
    end

    it 'should not change any value when any other value' do
      @direction = @rover.start_moving(moves: Random.rand(9).to_s)
      expect(@direction.y).to eq(y)
      expect(@direction.x).to eq(x)
      expect(@direction.command).to eq(command)
    end

    it 'should change command value from N to W' do
      @direction = @rover.start_moving(moves: moves[1])
      expect(@direction.y).to eq(y)
      expect(@direction.x).to eq(x)
      expect(@direction.command).to eq(:W)
    end

    it 'should change command value from N to E' do
      @direction = @rover.start_moving(moves: moves[2])
      expect(@direction.y).to eq(y)
      expect(@direction.x).to eq(x)
      expect(@direction.command).to eq(:E)
    end
  end
end