require 'date'

module CoreExtentions
  module HolidayJpInstanceMethods
    # Return true if the day is a Japanese holiday
    # Avoiding the name "jholiday?" for possible confilict with Jewish holidays
    def japanese_holiday?
      !HolidayJp.between(self, self).empty?
    end

    alias_method :is_japanese_holiday?, :japanese_holiday?
  end
end

class HolidayJp
  # Load holiday data
  # TODO: require がここにあるとわかりやすい？ かえってわかりにくい？
  require File.join(File.dirname(__FILE__), 'fixtures')
  
  # Japanese day names from Sunday to Saturday
  DAYNAMES_JA = %w(日 月 火 水 木 金 土)

  # Returns all the Japanese holidays between two dates
  def self.between(start, last)
    HOLIDAYS.find_all { |hd| start <= hd[:date] && hd[:date] <= last }
  end
end

Date.send(:include, CoreExtentions::HolidayJpInstanceMethods)
