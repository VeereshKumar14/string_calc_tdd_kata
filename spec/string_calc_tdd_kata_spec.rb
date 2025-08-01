require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    subject { described_class }

    context 'when input is empty' do
      it 'returns 0' do
        expect(described_class.add('')).to eq(0)
      end
    end 


  end