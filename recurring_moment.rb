require 'active_support'
require 'active_support/core_ext'
require 'pry'

class RecurringMoment

  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)



#ALTERNATE SOLUTION:
################################################

    if @period == 'monthly'

      # find the number of months between start date and target date:
      months_diff = (date.year * 12 + date.month) - (@start.year * 12 + @start.month)

      #check for different number of days in each month by advancing and checking for day equality
      if (@start.advance(months: months_diff).day != date.day)
        return false

      #check to see if interval falls evenly within difference
      elsif months_diff % @interval == 0
        return true
      else
        return false
      end

    elsif @period == 'weekly'
      #find weeks difference from days by dividing by 7
      #dates must fall on the same day of the week. Test does not account for this.
      weeks_diff = (date - @start) / 7

      #check to see if interval falls evenly within difference
      if weeks_diff % @interval == 0
        return true
      else
        return false
      end

    elsif @period == 'daily'
      #find days difference
      days_diff = date - @start

      ##check to see if interval falls evenly within difference
      if days_diff % @interval == 0
        return true
      else
        return false
      end
end

#############################################



#ORIGINAL SOLUTION
#############################################
#
#     new_date = @start
#     next_interval = @interval
#
#     while new_date <= date
#       if new_date == date
#         return true
#       end
#
#       if @period == 'monthly'
#         new_date = @start.advance(months: next_interval)
#       elsif @period == 'weekly'
#         new_date = @start.advance(weeks: next_interval)
#       elsif @period == 'daily'
#         new_date = @start.advance(days: next_interval)
#       end
#       next_interval += @interval
#     end
#
#     return false
#
#############################################


  end
end
