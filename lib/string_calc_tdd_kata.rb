class StringCalcTddKata
    def self.add(input)
        return 0 if input.strip.empty?
        
        delimiter = /,|\n/
        numbers_str = input

        if input.start_with?("//")
            delimiter_section, numbers_str = input.split("\n", 2)
            delimiter = Regexp.new(Regexp.escape(delimiter_section[2]))
        end

        sum_of_numbers = numbers_str.split(delimiter).map(&:to_i)  

        # Negative check
        negatives = sum_of_numbers.select { |n| n < 0 }
        unless negatives.empty?
            raise ArgumentError, "negatives not allowed: #{negatives.join(', ')}"
        end

        sum_of_numbers.sum
    end
end