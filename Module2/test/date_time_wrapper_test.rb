require 'rubygems'
gem 'mocha'
gem 'minitest'
require 'minitest/autorun'
require 'minitest/unit'
require 'mocha/minitest'

require 'date'
require_relative '../lib/Easy/date_time_wrapper'

class DateTimeWrapperTest < Minitest::Test
  include Module2
  def setup
    @time_1 = Time.new(2021, 11, 14)
    @time_2 = Time.new(2000, 1, 3)
    @time_3 = Time.new(2020, 8, 23)
  end

  def test_date_stored_correctly_constructor_dependency_injection_1
    date_time_wrapper = DateTimeWrapper.new(@time_1)
    assert_equal(@time_1, date_time_wrapper.today)
    assert_equal(@time_1, date_time_wrapper.get_now)
  end

  def test_date_stored_correctly_constructor_dependency_injection_2
    date_time_wrapper = DateTimeWrapper.new(@time_2)
    assert_equal(@time_2, date_time_wrapper.today)
    assert_equal(@time_2, date_time_wrapper.get_now)
  end

  def test_date_stored_correctly_constructor_dependency_injection_3
    date_time_wrapper = DateTimeWrapper.new(@time_3)
    assert_equal(@time_3, date_time_wrapper.today)
    assert_equal(@time_3, date_time_wrapper.get_now)
  end

  def test_date_stored_correctly_no_constructor_dependency_injection
    Time.stubs(:now).returns(Time.new(2021, 11, 14))
    date_time_wrapper = DateTimeWrapper.new
    assert_equal(@time_1, date_time_wrapper.today)
    assert_equal(@time_1, date_time_wrapper.get_now)
  end

  def test_date_printed_correctly
    date_time_wrapper = DateTimeWrapper.new(@time_2)
    assert_equal("2000-01-03 00:00:00 +0100", date_time_wrapper.to_s)
  end
end

