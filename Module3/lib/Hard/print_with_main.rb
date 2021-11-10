require_relative '../../common/database'
require_relative '../../common/invoice'
require_relative '../../common/printer'
require_relative '../../common/date_time_wrapper'
require_relative './invoice_writer'

module Module3
  class PrintInvoiceCommand
    attr_reader :database, :printer, :date_time

    def initialize(database, printer, date_time)
      @database = database
      @printer = printer
      @date_time = date_time
    end

    def execute(invoice_id)
      invoice = @database.get_invoice(invoice_id)

      invoice_writer = InvoiceWriter.new(@printer, invoice, @date_time)

      invoice_writer.write
    end
  end
  db = Database.new
  invoice_id = 'inv_1'
  db.file_path = "../../invoices/#{invoice_id}.txt"
  p = PrintInvoiceCommand.new(db, Printer.new, DateTimeWrapper.new)
  p.execute(invoice_id)
end
