#!/usr/bin/env ruby
#
# Simple ruby script which returns next Friday the 13th dates
#

require 'date'
require 'optparse'

class Friday13thFinder
  DEFAULT_YEARS_AHEAD = 25

  def initialize
    @options = { years_ahead: DEFAULT_YEARS_AHEAD }
    parse_options
  end

  def parse_options
    OptionParser.new do |opts|
      opts.banner = "Usage: #{$0} [options]"
      
      opts.on("-y", "--years YEARS", Integer, "Number of years ahead to search (default: #{DEFAULT_YEARS_AHEAD})") do |years|
        @options[:years_ahead] = years
      end
      
      opts.on("-h", "--help", "Show this help message") do
        puts opts
        exit
      end
    end.parse!
  rescue OptionParser::InvalidOption, OptionParser::MissingArgument => e
    abort_with_error(e.message)
  end

  def find_friday_13ths
    current_year = Date.today.year
    max_year = current_year + years_ahead

    (current_year..max_year).flat_map do |year|
      (1..12).map do |month|
        date = Date.new(year, month, 13)
        date if date.friday?
      end.compact
    end
  end

  def format_dates(dates)
    dates.map { |date| date.strftime("%Y-%m-13") }
  end

  def display_dates(dates)
    if dates.empty?
      puts "No Friday the 13th dates found in the next #{years_ahead} years."
      return
    end

    puts "Friday the 13th dates for the next #{years_ahead} years:"
    puts "-" * 50
    
    formatted_dates = format_dates(dates)
    formatted_dates.each_slice(3) do |date_group|
      puts date_group.map { |date| date.ljust(12) }.join(" ")
    end
    
    puts "\nTotal: #{dates.size} occurrences"
  end

  def run
    dates = find_friday_13ths
    display_dates(dates)
  end

  private

  def years_ahead
    years = @options[:years_ahead]
    return years if years.is_a?(Integer) && years >= 0

    abort_with_error("Years ahead must be a non-negative integer.")
  end

  def abort_with_error(message)
    warn "Error: #{message}"
    warn "Use -h for help"
    exit 1
  end
end

if __FILE__ == $0
  Friday13thFinder.new.run
end
