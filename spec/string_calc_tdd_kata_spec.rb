require_relative '../lib/string_calc_tdd_kata'

RSpec.describe StringCalcTddKata do
  describe '.add' do
    subject { described_class }

    context 'when input is empty' do
      it 'returns 0' do
        expect(described_class.add('')).to eq(0)
      end
    end

    context 'with one number' do
      it 'returns the number itself' do
        expect(described_class.add('1')).to eq(1)
        expect(described_class.add('7')).to eq(7)
      end
    end

    context 'with two numbers separated by comma' do
      it 'returns their sum' do
        expect(described_class.add('1,2')).to eq(3)
        expect(described_class.add('10,20')).to eq(30)
      end
    end

    context 'with unknown amount of numbers' do
      it 'returns their sum' do
        expect(described_class.add('1,2,3,4')).to eq(10)
        expect(described_class.add('5,5,5,5,5')).to eq(25)
      end
    end

    context 'with newline as delimiter' do
      it 'handles new lines between numbers' do
        expect(described_class.add("1\n2,3")).to eq(6)
        expect(described_class.add("4\n5\n6")).to eq(15)
      end
    end

    
  end
end