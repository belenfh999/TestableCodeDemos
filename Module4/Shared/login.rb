require_relative './user'
module Module4
  class Login
    attr_reader :user

    def initialize(user)
      @user = user
    end

    def ==(other)
      return self.user == other.user
    end
  end
end