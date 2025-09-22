#!/usr/bin/ruby
#
# Simple ruby script which returns next friday 13th for x years forward.
# 

current_year = Time.now.year
max_year = current_year + 25

# Find all Friday the 13th dates
friday_13th_dates = (current_year...max_year).flat_map do |year|
  (1..12).map do |month|
    date = Time.new(year, month, 13)
    date if date.friday?
  end.compact
end

# Format dates and output in 3 columns
friday_13th_dates.map! { |date| date.strftime("%Y-%m-13") }

friday_13th_dates.each_slice(3) do |date_group|
  puts date_group.join(" ")
end
