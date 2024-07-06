# frozen_string_literal: true

# This class provides a method to calculate the sum of numbers in a string.
# The input string can contain numbers separated by commas or new lines.

class Calculator
  def add(str)
    str = str.to_s
    return 0 if str.to_s.empty?

    numbers = str.split(',')
    numbers.map!(&:to_i)
    numbers.sum
  end
end
