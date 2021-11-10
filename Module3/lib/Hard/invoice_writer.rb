module Module3
  class InvoiceWriter
    attr_reader :printer, :invoice, :date_time

    def initialize(printer, invoice, date_time)
      @printer = printer
      @invoice = invoice
      @date_time = date_time
    end

    def write
      @printer.write_line("Invoice ID: #{invoice.id}")

      @printer.write_line("Total: $#{invoice.total}")

      @printer.write_line("Printed: #{@date_time.to_s}")
    end
  end
end
