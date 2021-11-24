# IoC Container Implementation done by https://gist.github.com/ne-sachirou
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
  # class B
  #   def initialize a; @a = a; end
  # end
  # c = Container.new do |c|
  #   c[:a] = 42
  #   c[:b] = B.new c[:a]
  #   c.factory(:b_new){|c| B.new c[:a] }
  # end
  # p c[:a]
  # p c[:b]
  # p c[:b]
  # p c[:b_new]
  # p c[:b_new]
end
