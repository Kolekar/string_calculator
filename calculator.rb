# frozen_string_literal: true

# This class provides a method to calculate the sum of numbers in a string.
# The input string can contain numbers separated by commas or new lines.

require 'pry'

class Calculator
  attr_reader :str

  def add(str)
    @str = str.to_s
    return 0 if str.to_s.empty?

    numbers = number_array
    negatives = numbers.select(&:negative?)
    raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    numbers.sum
  end

  private

  def number_array
    separator = find_separator
    @str = str.gsub("\n", separator)

    str.split(separator).map(&:to_i)
  end

  def find_separator
    return ',' unless str.start_with?('//')

    @str = str[2..]
    separator = str[0]
    @str = str[1..]
    separator
  end
end
