module Module2
  class PrintInvoiceCommand
    def execute(invoice_id)
      database = Database.new

      invoice = database.get_invoice(invoice_id)

      HardToTestPrinter.write_line("Invoice ID: #{invoice.id}")

      HardToTestPrinter.write_line("Total: $#{invoice.total}")

      date_time = Time.now

      HardToTestPrinter.write_line("Printed: #{date_time.to_s}")
    end
  end
end


