require_relative '../../common/invoice'
require_relative '../../common/database'
require_relative './printer'

module Module2
  class PrintInvoiceCommand
    def execute(invoice_id)
      database = Database.new
      database.file_path = "../../invoices/#{invoice_id}.txt"
      invoice = database.get_invoice(invoice_id)

      printer = HardToTestPrinter.new
      printer.write_line("Invoice ID: #{invoice.id}")

      printer.write_line("Total: $#{invoice.total}")

      date_time = Time.now

      printer.write_line("Printed: #{date_time.to_s}")
    end
  end
  p = PrintInvoiceCommand.new
  p.execute('inv_1')
end


