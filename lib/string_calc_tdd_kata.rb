class StringCalcTddKata
    def self.add(input)
        return 0 if input.strip.empty?
        
        delimiter = /,|\n/
        numbers_str = input

        if input.start_with?("//")
            delimiter_section, numbers_str = input.split("\n", 2)
            
            # Match multiple delimiters like [*], [%%], etc.
            custom_delimiters = delimiter_section.scan(/\[([^\]]+)\]/).flatten

            if custom_delimiters.any?
                escaped_delimiters = custom_delimiters.map { |d| Regexp.escape(d) }
                delimiter = Regexp.new(escaped_delimiters.join("|"))
            else
                # single delimiter like //;\n
                delimiter = Regexp.new(Regexp.escape(delimiter_section[2]))
            end    
        end

        sum_of_numbers = numbers_str.split(delimiter).map(&:to_i)  

        # Negative check
        negatives = sum_of_numbers.select { |n| n < 0 }
        unless negatives.empty?
            raise ArgumentError, "negatives not allowed: #{negatives.join(', ')}"
        end

        # Ignore numbers > 1000
        sum_of_numbers.reject { |num| num > 1000 }.sum
    end
end