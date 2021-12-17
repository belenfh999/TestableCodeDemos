require_relative '../../Shared/database'
require_relative '../../Shared/invoice_writer'
require_relative '../../Shared/user_not_authorized_exception'
require_relative '../../Shared/security'
require_relative '../../Shared/invoice_emailer'

module Module6
  class PrintOrEmailCommand
    attr_reader :database, :security, :invoice_writer, :invoice_emailer

    def initialize(database, security, invoice_writer, invoice_emailer)
      @database = database
      @security = security
      @invoice_writer = invoice_writer
      @invoice_emailer = invoice_emailer
    end

    def execute(invoice_id, should_email)
      invoice = @database.get_invoice(invoice_id)
      if should_email
        @invoice_emailer.email(invoice.content.email_address)
      else
        @security.set_user(invoice.user, invoice.is_admin)

        raise UserNotAuthorizedException.new unless @security.is_admin

        invoice.last_printed_by = @security.get_username

        @invoice_writer.write(invoice)

        @database.save
      end
    end
  end
  db = Module6::Database.new
  invoice_id = 'inv_1'
  # invoice_id = 'inv_2'
  db.file_path = "../../invoices/#{invoice_id}.txt"
  invoice_writer = InvoiceWriter.new(Printer.new, PageLayout.new, DateTimeWrapper.new)

  p = PrintOrEmailCommand.new(db, Security.new, invoice_writer, InvoiceEmailer.new(email_file_path))

  p.execute(invoice_id, false)
end
