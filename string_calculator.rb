class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiters, numbers_string = extract_delimiters_and_numbers(numbers)
    numbers_array = numbers_string.split(delimiters)

    negatives = numbers_array.select { |num| num.to_i.negative? }
    raise "Negative numbers not allowed: #{negatives.join(',')}" if negatives.any?

    numbers_array.map(&:to_i).inject(:+)
  end

  private

  def extract_delimiters_and_numbers(numbers)
    delimiter_match = numbers.match(/^\/\/(.+)\n(.+)/)
    if delimiter_match
      [Regexp.union(delimiter_match[1].split(/[\[\]]+/).reject(&:empty?)), delimiter_match[2]]
    else
      [/,|\n/, numbers]
    end
  end
end

# ---How to run---
# calculator = StringCalculator.new
# puts calculator.add("")