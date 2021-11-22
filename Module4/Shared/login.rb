require_relative './user'
module Module4
  class Login
    attr_reader :user

    def initialize(user)
      @user = user
    end
  end
end