require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  describe '.add' do
    context 'when input is empty or nil' do
      it 'returns 0 for an empty string' do
        expect(StringCalculator.add("")).to eq(0)
      end

      it 'returns 0 for a nil value' do
        expect(StringCalculator.add(nil)).to eq(0)
      end
    end

    context 'when input is a valid comma-separated string' do
      it 'returns the number itself for a single number' do
        expect(StringCalculator.add("5")).to eq(5)
      end

      it 'returns the sum for two numbers' do
        expect(StringCalculator.add("2,3")).to eq(5)
      end

      it 'returns the sum for multiple numbers' do
        expect(StringCalculator.add("1,2,3,4")).to eq(10)
      end
    end

    context 'when input contains newlines and commas' do
      it 'handles new lines between numbers and commas' do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end

      it 'handles new lines between numbers' do
        expect(StringCalculator.add("4\n5\n6")).to eq(15)
      end
    end

    context 'when using custom delimiters' do
      it 'handles semicolon (;) as a delimiter' do
        expect(StringCalculator.add("//;\n2;3")).to eq(5)
      end

      it 'handles custom delimiter mixed with spaces' do
        expect(StringCalculator.add("//:\n1:2")).to eq(3)
      end

      it 'handles pipe (|) as a delimiter' do
        expect(StringCalculator.add("//|\n1|2|3")).to eq(6)
      end
    end
  end
end
