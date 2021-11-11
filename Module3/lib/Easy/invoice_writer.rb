require_relative '../../common/invoice'
require_relative '../../common/date_time_wrapper'
require_relative '../../common/printer'
require_relative '../../common/page_layout'
require_relative './i_invoice_writer'


module Module3
  class InvoiceWriter < IInvoiceWriter
    attr_reader :printer, :invoice_state, :date_time

    def initialize(printer, layout, date_time)
      @printer = printer
      @layout = layout
      @date_time = date_time
    end

    def write(invoice)
      invoice_content = invoice.content
      overdue = invoice.state
      @printer.set_page_layout(@layout)
      overdue ? @printer.set_ink_color('red') : @printer.set_ink_color('default')

      @printer.write_line("Invoice ID: #{invoice_content.id}")

      @printer.write_line("Total: $#{invoice_content.total}")

      @printer.write_line("Printed: #{@date_time.to_s}")
    end
  end
end
