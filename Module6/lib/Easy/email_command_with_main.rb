require_relative '../../Shared/database'
require_relative '../../Shared/invoice_writer'
require_relative '../../Shared/user_not_authorized_exception'
require_relative '../../Shared/security'
require_relative '../../Shared/invoice_emailer'

module Module6
  class EmailCommand
    attr_reader :database, :security, :invoice_emailer

    def initialize(database, security, invoice_emailer)
      @database = database
      @security = security
      @invoice_emailer = invoice_emailer
    end

    def execute(invoice_id)
      invoice = @database.get_invoice(invoice_id)

      @invoice_emailer.email(invoice)
    end
  end
  db = Module6::Database.new
  invoice_id = 'inv_1'
  # invoice_id = 'inv_2'
  # invoice_id = 'inv_3'
  db.file_path = "../../invoices/#{invoice_id}.txt"

  p = EmailCommand.new(db, Security.new, InvoiceEmailer.new)

  p.execute(invoice_id)
end
