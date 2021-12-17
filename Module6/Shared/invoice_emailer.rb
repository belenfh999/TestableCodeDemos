require_relative './i_invoice_emailer'
require_relative './email_validator'

module Module6
  class InvoiceEmailer < IInvoiceEmailer
    attr_accessor :email_validator

    def initialize
      @email_validator = EmailValidator.new(@email)
    end

    def email(invoice)
      email_address = invoice.content.email_address
      puts("Invoice emailed to: #{email_address}") if @email_validator.valid? email_address
    end
  end
end
