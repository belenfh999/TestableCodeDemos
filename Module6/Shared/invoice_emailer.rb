require_relative './i_invoice_emailer'

module Module6
  class InvoiceEmailer < IInvoiceEmailer
    def email(invoice)
      puts("Invoice emailed to: #{invoice.content.email_address}")
    end
  end
end
