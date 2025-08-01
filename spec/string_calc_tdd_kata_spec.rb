require_relative '../lib/string_calc_tdd_kata'

RSpec.describe StringCalcTddKata do
  describe '.add' do
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

    context 'with custom single-character delimiter' do
      it 'uses the specified delimiter' do
        expect(described_class.add("//;\n1;2")).to eq(3)
        expect(described_class.add("//-\n4-5-6")).to eq(15)
      end
    end

    context 'with negative numbers' do
      it 'raises an error with the negative number' do
        expect {
          described_class.add("1,-2")
        }.to raise_error(ArgumentError, "negatives not allowed: -2")
      end

      it 'raises an error listing all negative numbers' do
        expect {
          described_class.add("1,-2,-5,3")
        }.to raise_error(ArgumentError, "negatives not allowed: -2, -5")
      end
    end

    context 'with numbers greater than 1000' do
      it 'ignores numbers > 1000' do
        expect(described_class.add("2,1001")).to eq(2)
        expect(described_class.add("1000,1001,3")).to eq(1003)
      end
    end

    context "with custom multi-character delimiter" do
      it "handles delimiters of any length" do
        expect(described_class.add("//[***]\n1***2***3")).to eq(6)
        expect(described_class.add("//[abc]\n4abc5abc1")).to eq(10)
      end
    end

    context "with multiple single-character delimiters" do
      it "handles each delimiter" do
        expect(described_class.add("//[*][%]\n1*2%3")).to eq(6)
        expect(described_class.add("//[#][@]\n5#3@2")).to eq(10)
      end
    end

    context "with multiple multi-character delimiters" do
      it "handles complex delimiters" do
        expect(described_class.add("//[**][%%]\n1**2%%3")).to eq(6)
        expect(described_class.add("//[--][@@@]\n2--3@@@4")).to eq(9)
      end
    end
  end
end