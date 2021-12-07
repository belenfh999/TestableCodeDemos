module Module6
  class Invoice
    attr_accessor :id, :total, :status, :last_printed_by, :email_address
    invoice_status = {
                      :open => "open",
                      :closed => "closed",
                      :cancelled => "cancelled"
                     }
  end
end
