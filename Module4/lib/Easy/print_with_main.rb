require_relative '../../Shared/database'
require_relative '../../Shared/invoice'
require_relative '../../Shared/printer'
require_relative '../../Shared/date_time_wrapper'
require_relative '../../Shared/invoice_writer'
require_relative '../../Shared/identity_service'

module Module4
  class PrintInvoiceCommand
    attr_reader :database, :invoice_writer, :identity

    def initialize(database, invoice_writer, identity)
      @database = database
      @invoice_writer = invoice_writer
      @identity = identity
    end

    def execute(invoice_id)
      invoice = @database.get_invoice(invoice_id)

      invoice.last_printed_by = @identity.username

      @invoice_writer.write(invoice)

      @database.save
    end
  end
  db = Database.new
  invoice_id = 'inv_1'
  # invoice_id = 'inv_2'
  db.file_path = "../../invoices/#{invoice_id}.txt"

  p = PrintInvoiceCommand.new(db, InvoiceWriter.new(Printer.new, PageLayout.new, DateTimeWrapper.new), IdentityService.new("Arthur"))
  p.execute(invoice_id)
end