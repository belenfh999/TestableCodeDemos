require_relative './i_email_validator'
require_relative './email_address_is_blank_exception'

module Module6
  class EmailValidator < IEmailValidator
    attr_accessor :emails

    def initialize(file_path)
      @emails = []
      file = File.open(File.expand_path("emails.txt", File.dirname(file_path)))
      file.each do |each_line|
        @emails.push(each_line.strip)
      end
    end

    def valid?(address)
      raise EmailAddressIsBlankException if address == ""
      @emails.include? address
    end
  end
end
