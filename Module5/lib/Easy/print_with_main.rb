require_relative '../../Shared/database'
require_relative '../../Shared/invoice_writer'
require_relative '../../Shared/user_not_authorized_exception'
require_relative './security'

module Module5
  class PrintInvoiceCommandEasy
    attr_reader :database, :security, :invoice_writer

    def initialize(database, security, invoice_writer)
      @database = database
      @security = security
      @invoice_writer = invoice_writer
    end

    def execute(invoice_id)
      invoice = @database.get_invoice(invoice_id)

      @security.set_user(invoice.user, invoice.is_admin)

      raise UserNotAuthorizedException.new unless @security.is_admin

      invoice.last_printed_by = @security.get_username

      @invoice_writer.write(invoice)

      @database.save
    end
  end
  db = Module5::Database.new
  invoice_id = 'inv_1'
  # invoice_id = 'inv_2'
  db.file_path = "../../invoices/#{invoice_id}.txt"
  invoice_writer = InvoiceWriter.new(Printer.new, PageLayout.new, DateTimeWrapper.new)

  p = PrintInvoiceCommandEasy.new(db, Security.new, invoice_writer)

  p.execute(invoice_id)
end