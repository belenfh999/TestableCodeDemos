require_relative '../Shared/container'
require_relative '../Shared/database'
require_relative '../Shared/invoice'
require_relative '../Shared/printer'
require_relative '../Shared/date_time_wrapper'
require_relative '../Shared/invoice_writer'
require_relative '../Shared/session'
require_relative '../Shared/login'
require_relative '../Shared/user'

module Module4
  class PrintInvoiceCommand
    attr_reader :container

    def initialize(container)
      @container = container
    end

    def execute(invoice_id)
      invoice = @container[:database].get_invoice(invoice_id)

      invoice.last_printed_by = container[:session].get_login.user.username

      @container[:invoice_writer].write(invoice)

      @container[:database].save
    end
  end
  db = Database.new
  invoice_id = 'inv_1'
  # invoice_id = 'inv_2'
  db.file_path = "../../Module4/invoices/#{invoice_id}.txt"
  c = Container.new do |c|
      c[:database] = db
      c[:invoice_writer] = InvoiceWriter.new(Printer.new, PageLayout.new, DateTimeWrapper.new)
      c[:session] = Session.new(Login.new(User.new("Arthur")))
    end
  p = PrintInvoiceCommand.new(c)
  p.execute(invoice_id)
end