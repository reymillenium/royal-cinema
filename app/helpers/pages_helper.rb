require 'dotiw'

include ActionView::Helpers::DateHelper
include ActionView::Helpers::TextHelper
include ActionView::Helpers::NumberHelper

module PagesHelper

  def date_diff(date1, date2, units = :months)
    seconds_between = (date2.to_i - date1.to_i).abs
    days_between = seconds_between / 60 / 60 / 24

    case units
    when :days
      days_between.floor
    when :months
      (days_between / 30).floor
    when :years
      (days_between / 365).floor
    else
      seconds_between.floor
    end
  end

  def descriptive_diff(date1, date2)
    distance_of_time_in_words(date1, date2, false, only: %i[years months weeks])
  end

end
