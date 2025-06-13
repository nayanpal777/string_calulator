class StringCalculator < ApplicationRecord

  def self.add(input)
    return 0 if input.nil? || input&.strip&.empty?

    delimiter = /,|\n/

    if input.start_with?("//")
      start_str, input = input.split("\n", 2)
      custom_delimiter = start_str[2..]  # everything after //

      delimiter = Regexp.union(custom_delimiter, ",", "\n")
    end
    numbers = input.split(delimiter).map(&:strip)

    int_numbers = numbers.map(&:to_i)
    negatives = int_numbers.select { |n| n < 0 }

    if negatives.any?
      raise ArgumentError, "negative numbers not allowed: #{negatives.join(', ')}"
    end

    int_numbers.map(&:to_i).sum
  end
end
