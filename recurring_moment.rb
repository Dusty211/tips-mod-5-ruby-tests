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

    if @period == 'monthly'
      # binding.pry
      months_diff = (date.year * 12 + date.month) - (@start.year * 12 + @start.month)
      if (@start.advance(months: months_diff).day != date.day)
        return false
      elsif months_diff % @interval == 0
        return true
      else
        return false
      end

    elsif @period == 'weekly'
      weeks_diff = (date - @start) / 7
      if weeks_diff % @interval == 0
        return true
      else
        return false
      end

    elsif @period == 'daily'
      days_diff = date - @start
      if days_diff % @interval == 0
        return true
      else
        return false
      end
end

    #
    # binding.pry
    #
    # new_date = @start
    # next_interval = @interval
    #
    # while new_date <= date
    #   if new_date == date
    #     return true
    #   end
    #
    #   if @period == 'monthly'
    #     new_date = @start.advance(months: next_interval)
    #   elsif @period == 'weekly'
    #     new_date = @start.advance(weeks: next_interval)
    #   elsif @period == 'daily'
    #     new_date = @start.advance(days: next_interval)
    #   end
    #   next_interval += @interval
    # end

    return false
  end
end
