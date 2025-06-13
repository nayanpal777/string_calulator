require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns 0 for an nil value' do
      expect(StringCalculator.add(nil)).to eq(0)
    end

    it 'returns the number itself for single number' do
      expect(StringCalculator.add("5")).to eq(5)
    end

    it 'returns the sum for two numbers' do
      expect(StringCalculator.add("2,3")).to eq(5)
    end

    it 'returns the sum for multiple numbers' do
      expect(StringCalculator.add("1,2,3,4")).to eq(10)
    end
  end
end
