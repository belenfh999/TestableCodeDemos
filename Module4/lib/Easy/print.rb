require_relative '../../Shared/database'
require_relative '../../Shared/invoice_writer'
require_relative '../../Shared/identity_service'

module Module4
  class PrintEasyInvoiceCommand
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
end