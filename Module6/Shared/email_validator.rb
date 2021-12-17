require_relative './i_email_validator'
module Module6
  class EmailValidator < IEmailValidator
    def valid?(address)
      raise 'Don\'t forget to implement the valid? method'
    end
  end
end
