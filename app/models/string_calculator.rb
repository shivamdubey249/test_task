class StringCalculator < ApplicationRecord
	def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[numbers.index("\n") + 1..-1]
    end

    numbers = numbers.split(/[\n#{delimiter}]/)
    negatives = numbers.select { |num| num.to_i.negative? }.map(&:to_i)
    raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    numbers.sum(&:to_i)
  end
end