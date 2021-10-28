require 'minitest/autorun'
require 'date'
require_relative '../common/database'
require_relative '../common/invoice'

class DatabaseTest < Minitest::Test
  include Module2
  def setup
    @database = Database.new
    @invoice = Invoice.new
  end

  def test_read_first_line_id_inv_1
    invoice_id = 'inv_1'
    @invoice.id = invoice_id
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).id)
  end

  def test_read_first_line_id_inv_2
    invoice_id = 'inv_2'
    @invoice.id = invoice_id
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).id)
  end

  def test_read_first_two_lines_inv_1
    invoice_id = 'inv_1'
    @invoice.id = invoice_id
    @invoice.total = 30.0
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).total)
  end

  def test_read_first_two_lines_inv_2
    invoice_id = 'inv_2'
    @invoice.id = invoice_id
    @invoice.total = 303.0
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).total)
  end

  def test_read_first_three_lines_inv_1
    invoice_id = 'inv_1'
    @invoice.id = invoice_id
    @invoice.total = 30.0
    @invoice.date = Date.parse('10-10-2021')
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).total)
    assert_equal(@invoice.date, @database.get_invoice(invoice_id).date)
  end

  def test_read_first_three_lines_inv_2
    invoice_id = 'inv_2'
    @invoice.id = invoice_id
    @invoice.total = 303.0
    @invoice.date = Date.parse('20-10-2010')
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).total)
    assert_equal(@invoice.date, @database.get_invoice(invoice_id).date)
  end
end

