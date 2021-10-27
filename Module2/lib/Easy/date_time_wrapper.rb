module Module2
  class DateTimeWrapper < IDateTimeWrapper
    def get_now
      Time.now
    end
  end
end
