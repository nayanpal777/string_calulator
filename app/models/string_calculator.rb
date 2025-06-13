class StringCalculator < ApplicationRecord

  def self.add(input)
    return 0 if input.nil? || input&.strip&.empty?

    numbers = input.split(",").map(&:strip)

    numbers.map(&:to_i).sum
  end
end
