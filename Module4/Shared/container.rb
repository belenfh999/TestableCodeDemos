module Module4
  class Container
    def initialize
      @c   = {}
      @fac = {}
      yield self
    end

    def [] k
      @c[k] || (@fac[k] && @fac[k].call(self))
    end

    def []= k, v
      @c[k] = v
    end

    def factory k, &b
      @fac[k] = b
    end
  end
end
