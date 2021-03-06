#!/usr/bin/ruby
#
# Simple ruby script which returns next friday 13th for x years forward.
# 

year = Time.now().year
yearmax = year + 25
dates = []

#
# iterate over years and months
#

while year < yearmax
 month = 1
 while month < 13
   curdate = Time.new(year, month, 13)
   if curdate.friday?
    month < 10 ? newmonth = "0" + month.to_s : newmonth = month
    dates << "#{year}-#{newmonth}-13"
   end
   month = month + 1
 end
 year = year + 1
end

#
# present a list with 3 columns of upcoming fridays
#

iter = 1
for date in dates
 print date + " "
 if iter > 3
   print "\n"
   iter = 0
 end
 iter = iter + 1
end
puts ""
