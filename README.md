# String Calculator TDD Kata

A simple string-based calculator written in Ruby using TDD apporach.

## Setup Instructions
Make sure your environment has:

- **Ruby** version 3.0 or later
- **Bundler** installed (`gem install bundler`)
- **Rails** version 7.0 or later

 This app runs entirely as a command-line script.

---

## Setup Instructions

After Cloning the repo or extracting the ZIP:

1. Open a terminal and `cd` into the project folder.

2. Install all Ruby dependencies:

   ```bash
   bundle install
   ```

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

### Rspec Results

```bash
StringCalcTddKata
  .add
    when input is empty
      returns 0
    with one number
      returns the number itself
    with two numbers separated by comma
      returns their sum
    with unknown amount of numbers
      returns their sum
    with newline as delimiter
      handles new lines between numbers
    with custom single-character delimiter
      uses the specified delimiter
    with negative numbers
      raises an error with the negative number
      raises an error listing all negative numbers
    with numbers greater than 1000
      ignores numbers > 1000
    with custom multi-character delimiter
      handles delimiters of any length
    with multiple single-character delimiters
      handles each delimiter
    with multiple multi-character delimiters
      handles complex delimiters;
    edge cases
      handles input with trailing delimiter
      ignores extra whitespace in numbers
      returns 0 if all values are empty or spaces
```