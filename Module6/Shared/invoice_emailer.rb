require_relative './i_invoice_emailer'
require_relative './email_validator'

module Module6
  class InvoiceEmailer < IInvoiceEmailer
    attr_accessor :email_validator

    def initialize(file_path)
      @email_validator = EmailValidator.new(file_path)
    end

    def email(invoice)
      email_address = invoice.content.email_address
      @email_validator.update_emails
      puts("Invoice emailed to: #{email_address}") if @email_validator.valid? email_address
    end

  end
end
