# frozen_string_literal: true

# spec/calculator_spec.rb

require_relative './spec_helper'
require_relative '../calculator'

RSpec.describe Calculator do
  let(:calculator) { Calculator.new }
  describe 'add method to handle comma between numbers' do
    it 'returns zero when string is empty' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns element when string with single element' do
      expect(calculator.add('1')).to eq(1)
    end

    it 'returns addition of two element' do
      expect(calculator.add('1,5')).to eq(6)
    end
  end

  describe 'add method to handle any amount of numbers' do
    it 'returns addition of three element' do
      expect(calculator.add('1,2,3')).to eq(6)
    end

    it 'returns addition of four element' do
      expect(calculator.add('1,2,3,4')).to eq(10)
    end
  end

  describe 'add method to handle new lines between numbers' do
    it 'returns addition of element' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end
  end

  describe 'support different delimiters' do
    it 'returns addition of element' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'returns addition three element' do
      expect(calculator.add("//|\n1|2|6")).to eq(9)
    end
  end

  describe 'add with a negative number' do
    it 'will throw an exception' do
      expect { calculator.add("//|\n1|-2|6") }.to raise_error(RuntimeError, 'Negative numbers not allowed: -2')
    end

    it 'will throw an exception with all negative numbers' do
      expect { calculator.add('1,-2,3,-4') }.to raise_error(RuntimeError, 'Negative numbers not allowed: -2, -4')
    end
  end
end
