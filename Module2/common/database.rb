require 'date'
require_relative '../lib/Easy/i_database'

module Module2
  class Database < IDatabase

    def get_invoice(invoice_id)
      invoice = Invoice.new
      line_index = 0
      file_path = "../TestableCodeDemos/Module2/invoices/#{invoice_id}.txt"
      file = File.open(File.expand_path("#{invoice_id}.txt", File.dirname(file_path)))
      file.each do |each_line|
        each_line = each_line.strip
        case line_index
        when 0
          invoice.id = each_line
        when 1
          invoice.total = each_line.to_f
        when 2
          invoice.date = Date.parse(each_line)
        end
        line_index += 1
      end
      invoice
    end

  end
end

