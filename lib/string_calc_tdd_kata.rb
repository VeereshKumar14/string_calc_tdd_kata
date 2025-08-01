class StringCalcTddKata
    def self.add(input)
        return 0 if input.strip.empty?

        sum_of_numbers = input.split(',').map(&:to_i)            

        sum_of_numbers.sum
    end
end