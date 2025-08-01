class StringCalcTddKata
	DEFAULT_DELIMITERS = [",", "\n"].freeze
	MAX_NUMBER = 1000
	MIN_NUMBER = 0

	def self.add(input)
		return 0 if input.strip.empty?

		numbers_str = input

		delimiters, numbers_string = extract_delimiters_and_numbers(input)
    sum_of_numbers = split_numbers(numbers_str, delimiters)

		# Negative check
		raise_for_negatives(sum_of_numbers)

		# Ignore numbers > 1000
		sum_of_numbers.reject { |num| num > MAX_NUMBER }.sum
	end

	private

	 def self.extract_delimiters_and_numbers(input)
    return [DEFAULT_DELIMITERS, input] unless input.start_with?("//")

    delimiter_line, number_part = input.split("\n", 2)
    delimiter_string = delimiter_line[2..]

    delimiters = if delimiter_string.start_with?("[")
								   delimiter_string.scan(/\[([^\]]+)\]/).flatten
								 else
										[delimiter_string]
								 end

    [DEFAULT_DELIMITERS + delimiters, number_part]
  end

  def self.split_numbers(numbers_string, delimiters)
    escaped_delimiters = delimiters.map { |delimiter| Regexp.escape(delimiter) }
    delimiter_regex = Regexp.new(escaped_delimiters.join("|"))
    numbers_string.split(delimiter_regex).map(&:to_i)
  end

	def self.raise_for_negatives(numbers)
    negatives = numbers.select { |num| num < MIN_NUMBER }
		unless negatives.empty?
			raise ArgumentError, "negatives not allowed: #{negatives.join(', ')}"
		end
  end
end