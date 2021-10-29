require_relative './i_date_time_wrapper'
module Module2
  class DateTimeWrapper < IDateTimeWrapper
    attr_reader :today

    def initialize
      @today = Time.now
    end
    def get_now
      @today
    end

    def to_s
      @today.to_s
    end
  end
end
