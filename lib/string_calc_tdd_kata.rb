class StringCalcTddKata
    def self.add(input)
        return 0 if input.strip.empty?
        delimiter = /,|\n/

        sum_of_numbers = input.split(delimiter).map(&:to_i)            

        sum_of_numbers.sum
    end
end