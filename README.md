# nextFriday13th

Simple Ruby script to find upcoming Friday the 13th dates. This was my first Ruby script and serves as a memory of my first programming accomplishment.

## Features

- Finds all Friday the 13th dates for a specified number of years ahead
- Command-line options for customization
- Clean, formatted output in columns
- Error handling for invalid inputs

## Installation

```bash
git clone https://github.com/AlexanderSalmin/nextFriday13th.git
cd nextFriday13th
```

## Usage

### Basic usage (default: 25 years ahead)
```bash
ruby nf13.rb
```

### Custom number of years
```bash
ruby nf13.rb --years 10
ruby nf13.rb -y 50
```

### Help
```bash
ruby nf13.rb --help
```

## Requirements

- Ruby 2.0+ (compatible with Ruby 1.9.3+)

## Example Output

```
Friday the 13th dates for the next 25 years:
--------------------------------------------------
2025-06-13   2026-02-13   2026-03-13
2027-08-13   2028-10-13   2029-04-13
2029-07-13   2030-09-13   2031-12-13
2032-02-13   2033-03-13   2033-11-13
2034-08-13   2035-05-13   2036-01-13
2036-06-13   2037-02-13   2037-03-13
2038-08-13   2039-05-13   2040-01-13
2040-04-13   2040-07-13   2041-09-13
2042-12-13   2043-03-13   2043-11-13
2044-05-13   2045-01-13   2045-10-13
2046-04-13   2046-07-13   2047-09-13
2048-12-13   2049-03-13   2049-11-13

Total: 43 occurrences
```

## Contributing

I welcome improvements! Feel free to submit pull requests or suggest enhancements.
