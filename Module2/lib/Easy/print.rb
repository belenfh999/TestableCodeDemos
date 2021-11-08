require_relative '../../common/database'
require_relative '../../common/invoice'
require_relative './printer'
require_relative './date_time_wrapper'
module Module2
  class PrintInvoiceCommand
    attr_reader :database, :printer, :date_time

    def initialize(database, printer, date_time)
      @database = database
      @printer = printer
      @date_time = date_time
    end

    def execute(invoice_id)
      invoice = @database.get_invoice(invoice_id)

      @printer.write_line("Invoice ID: #{invoice.id}")

      @printer.write_line("Total: $#{invoice.total}")

      @printer.write_line("Printed: #{@date_time.to_s}")
    end
  end
end
