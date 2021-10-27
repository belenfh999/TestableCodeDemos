module Module2
  class Database < IDatabase
    def get_invoice(invoice_id)
      invoice = Invoice.new
      line_index = 0
      File.foreach("../invoices/#{invoice_id}.txt") do |each_line|
        case line_index
        when 0
          invoice.id = each_line
        when 1
          invoice.total = each_line.to_f
        when 2
          invoice.date = each_line
        end
      end
    end
  end
end

