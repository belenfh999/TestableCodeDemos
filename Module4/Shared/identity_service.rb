require_relative './i_identity_service'
module Module4
  class IdentityService < IIdentityService
    attr_reader :username

    def initialize(username)
      @username = username
    end
    def get_username()
      @username
    end
  end
end
