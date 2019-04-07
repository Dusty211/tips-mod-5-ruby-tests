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

    new_date = @start
    next_interval = @interval

    while new_date <= date
      if new_date == date
        return true
      end

      if @period == 'monthly'
        new_date = @start.advance(months: next_interval)
      elsif @period == 'weekly'
        new_date = @start.advance(weeks: next_interval)
      elsif @period == 'daily'
        new_date = @start.advance(days: next_interval)
      end
      next_interval += @interval
    end

    return false
  end
end
