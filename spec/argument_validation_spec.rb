require 'spec_helper'
require 'securerandom'

describe ArgumentValidation do
  let(:rand_num) { Random.rand(999) }
  let(:rand_str) { SecureRandom.alphanumeric(5) }
  let(:wrong_coordinate) { SecureRandom.alphanumeric(5).upcase }
  let(:coordinate) { 'LR' }

  describe '.is_integer!' do
    it 'should convert number of string to number' do
      expect(ArgumentValidation.is_integer!(rand_num.to_s)).to eq(rand_num)
    end

    it 'should raise exception' do
      expect { ArgumentValidation.is_integer!(rand_str) }
      .to raise_exception(ArgumentError)
    end
  end

  describe '.is_valid_coordinate!' do
    it 'should raise exceptipon when given any other value' do
      expect{ArgumentValidation.is_valid_coordinate!(wrong_coordinate)}
      .to raise_error(StandardError, "Invalid arguments #{wrong_coordinate}")
    end

    it 'should return coordinate' do
      expect(ArgumentValidation.is_valid_coordinate!(coordinate)).to eq(coordinate)
    end
  end

  describe '.is_valid_command!' do
    it 'should raise exceptipon when given any other value' do
      expect{ArgumentValidation.is_valid_command!('Z')}
      .to raise_error(StandardError, 'Invalid arguments Z')
    end

    it 'should return word' do
      expect(ArgumentValidation.is_valid_command!(:E)).to eq(:E)
    end
  end
end