require_relative '../../common/database'
require_relative '../../common/invoice'
require_relative '../../common/printer'
require_relative '../../common/date_time_wrapper'
require_relative './invoice_writer'

module Module3
  class PrintInvoiceCommand
    attr_reader :database, :writer

    def initialize(database, writer)
      @database = database
      @writer = writer
    end

    def execute(invoice_id)
      invoice = @database.get_invoice(invoice_id)

      @writer.write(invoice)
    end
  end
  db = Database.new
  invoice_id = 'inv_1'
  # invoice_id = 'inv_2'
  db.file_path = "../../invoices/#{invoice_id}.txt"
  p = PrintInvoiceCommand.new(db, InvoiceWriter.new(Printer.new, PageLayout.new, DateTimeWrapper.new))
  p.execute(invoice_id)
end
