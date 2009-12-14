require File.dirname(__FILE__) + '/helper'

class TestHolidayJp < Test::Unit::TestCase
  should "#between return correct holidays" do
    holidays = HolidayJp.between(Date.new(2009, 1, 1), Date.new(2009, 1, 31))
    assert_equal holidays[0][:date], Date.new(2009, 1, 1)
    assert_equal holidays[0][:name], "元日"
    assert_equal holidays[1][:date], Date.new(2009, 1, 12)
    assert_equal holidays[1][:name], "成人の日"
  end
  
  context "#japanese_holiday?()" do
    should "return true if the day is a Japanese holiday" do
      assert Date.civil(2009,1,1).japanese_holiday?
    end
    should "return false if the day is not a Japanese holiday" do
      assert !Date.civil(2009,1,2).japanese_holiday?
    end
  end
  
  context "#is_japanese_holiday?" do
    should "work the same as #japanese_holiday?()" do
      assert Date.civil(2009,1,1).is_japanese_holiday?
      assert !Date.civil(2009,1,2).is_japanese_holiday?
    end
  end
end
