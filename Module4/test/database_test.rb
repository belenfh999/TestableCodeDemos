require 'minitest/autorun'
require 'date'
require_relative '../Shared/database'
require_relative '../Shared/invoice'

class DatabaseTest < Minitest::Test
  include Module4
  def setup
    @database = Database.new
    @invoice = Invoice.new
  end

  def test_read_first_line_id_inv_1
    invoice_id = 'inv_1'
    @database.file_path = "../TestableCodeDemos/Module4/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
  end

  def test_read_first_line_id_inv_2
    invoice_id = 'inv_2'
    @database.file_path = "../TestableCodeDemos/Module4/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
  end

  def test_read_first_two_lines_inv_1
    invoice_id = 'inv_1'
    @database.file_path = "../TestableCodeDemos/Module4/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    @invoice.total = 30.0
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).content.total)
  end

  def test_read_first_two_lines_inv_2
    invoice_id = 'inv_2'
    @database.file_path = "../TestableCodeDemos/Module4/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    @invoice.total = 303.0
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).content.total)
  end

  def test_read_first_three_lines_inv_1
    invoice_id = 'inv_1'
    @database.file_path = "../TestableCodeDemos/Module4/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    @invoice.total = 30.0
    invoice_state = true
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).content.total)
    assert_equal(invoice_state, @database.get_invoice(invoice_id).state)
  end

  def test_read_first_three_lines_inv_2
    invoice_id = 'inv_2'
    @database.file_path = "../TestableCodeDemos/Module4/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    @invoice.total = 303.0
    invoice_state = false
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).content.total)
    assert_equal(invoice_state, @database.get_invoice(invoice_id).state)
  end
end

