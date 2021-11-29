require_relative './i_security'

module Module5
  class Security < ISecurity
    attr_reader :username, :is_admin

    def set_user(username, is_admin)
      @username = username
      @is_admin = is_admin
    end

    def get_username
      @username
    end

    def is_admin
      @is_admin
    end
  end
end
