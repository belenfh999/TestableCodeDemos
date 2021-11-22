module Module4
  class Session < ISession
    attr_reader :login

    def initialize(login)
      @login = login
    end

    def get_login
      @login
    end
  end
end
