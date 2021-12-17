require_relative './i_email_validator'
require_relative './email_address_is_blank_exception'

module Module6
  class EmailValidator < IEmailValidator
    attr_accessor :email

    def initialize(email)
      @email = email
    end

    def valid?(address)
      raise EmailAddressIsBlankException if address == ""
      true
    end
  end
end
