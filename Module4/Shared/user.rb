module Module4
  class User
    attr_reader :username

    def initialize(username)
      @username = username
    end

    def ==(other)
      return self.username == other.username
    end
  end
end