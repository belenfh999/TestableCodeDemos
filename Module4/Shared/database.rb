require_relative './i_database'
require 'ostruct'

module Module4
  class Database < IDatabase
    attr_accessor :file_path

    def get_invoice(invoice_id)
      invoice = OpenStruct.new
      invoice.content = Invoice.new
      invoice.state = false
      line_index = 0
      file = File.open(File.expand_path("#{invoice_id}.txt", File.dirname(@file_path)))

      file.each do |each_line|
        each_line = each_line.strip
        case line_index
        when 0
          invoice.content.id = each_line
        when 1
          invoice.content.total = each_line.to_f
        when 2
          invoice.state = true?(each_line)
        else
          break
        end
        line_index += 1
      end
      invoice
    end

    private

    def true?(str)
      return true if str == 'true'
      return false if str == 'false'
    end
  end
end

