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

    numbers.map(&:to_i).sum
  end
end
