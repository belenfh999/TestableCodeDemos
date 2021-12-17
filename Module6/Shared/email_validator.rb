require_relative './i_email_validator'
require_relative './email_address_is_blank_exception'

module Module6
  class EmailValidator < IEmailValidator
    attr_accessor :emails, :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def valid?(address)
      raise EmailAddressIsBlankException if address == ""
      @emails.include? address
    end

    def update_emails
      @emails = []
      file = File.open(@file_path)
      file.each do |each_line|
        @emails.push(each_line.strip)
      end
    end
  end
end
