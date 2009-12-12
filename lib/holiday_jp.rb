require 'date'
require 'fixtures'

class HolidayJp
  
  DAYNAMES_JA = %w(日 月 火 水 木 金 土)

  def self.between(start, last)
    HOLIDAYS.find_all { |hd| start <= hd[:date] && hd[:date] <= last }
  end
end
