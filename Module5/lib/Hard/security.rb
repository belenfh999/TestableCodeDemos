module Module5
  class Security
    attr_accessor :username, :is_admin
    @@instance << self

    def set_user(username, is_admin)
      @username = username
      @is_admin = is_admin
    end
  end
end