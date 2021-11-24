require_relative '../Shared/container'

module Module4
  class PrintInvoiceCommand
    attr_reader :container

    def initialize(container)
      @container = container
    end

    def execute(invoice_id)
      invoice = @container[:database].get_invoice(invoice_id)

      @container[:invoice_writer].write(invoice)


    end
  end




  invoice.LastPrintedBy = _container
                            .Get<ISession>()
                                            .GetLogin()
                                            .GetUser()
                                            .GetUserName();

  _container
    .Get<IDatabase>()
                     .Save();
  }
end