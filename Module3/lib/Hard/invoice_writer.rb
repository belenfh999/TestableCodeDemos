require_relative '../../common/invoice'
require_relative '../../common/date_time_wrapper'
require_relative '../../common/printer'
require_relative '../../common/page_layout'


module Module3
  class InvoiceWriter
    attr_reader :printer, :invoice, :invoice_state, :date_time

    def initialize(printer, invoice, date_time)
      @printer = printer
      @invoice = invoice.content
      @printer.set_page_layout(PageLayout.new)

      invoice.state ? @printer.set_ink_color('red') : @printer.set_ink_color('default')

      @date_time = date_time
    end

    def write
      @printer.write_line("Invoice ID: #{@invoice.id}")

      @printer.write_line("Total: $#{@invoice.total}")

      @printer.write_line("Printed: #{@date_time.to_s}")
    end
  end
end
