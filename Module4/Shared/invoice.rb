module Module4
  class Invoice
    attr_accessor :id, :total, :status, :last_printed_by
    invoice_status = {
                      :open => "open",
                      :closed => "closed",
                      :cancelled => "cancelled"
                     }
  end
end
