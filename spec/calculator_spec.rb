# frozen_string_literal: true

# spec/calculator_spec.rb

require_relative './spec_helper'
require_relative '../calculator'

RSpec.describe Calculator do
  let(:calculator) { Calculator.new }
  describe '#add' do
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
end
