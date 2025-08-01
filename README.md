# String Calculator TDD Kata

A simple string-based calculator written in Ruby using TDD apporach.

## Running the App

```ruby
StringCalculator.add("1,2")              # => 3
StringCalculator.add("//;\n1;2")         # => 3
StringCalculator.add("//[***]\n1***2")   # => 3
   ```  

# Running Tests

To run the full RSpec test suite:

```bash
bundle exec rspec
```