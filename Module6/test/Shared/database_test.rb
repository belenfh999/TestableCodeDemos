require 'minitest/autorun'
require 'date'
require_relative '../../Shared/database'
require_relative '../../Shared/invoice'

class DatabaseTest < Minitest::Test
  include Module5
  def setup
    @database = Module5::Database.new
    @invoice = Module5::Invoice.new
  end

  def test_read_first_line_id_inv_1
    invoice_id = 'inv_1'
    @database.file_path = "../TestableCodeDemos/Module5/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
  end

  def test_read_first_line_id_inv_2
    invoice_id = 'inv_2'
    @database.file_path = "../TestableCodeDemos/Module5/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
  end

  def test_read_first_two_lines_inv_1
    invoice_id = 'inv_1'
    @database.file_path = "../TestableCodeDemos/Module5/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    @invoice.total = 30.0
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).content.total)
  end

  def test_read_first_two_lines_inv_2
    invoice_id = 'inv_2'
    @database.file_path = "../TestableCodeDemos/Module5/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    @invoice.total = 303.0
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).content.total)
  end

  def test_read_first_three_lines_inv_1
    invoice_id = 'inv_1'
    @database.file_path = "../TestableCodeDemos/Module5/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    @invoice.total = 30.0
    invoice_state = true
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).content.total)
    assert_equal(invoice_state, @database.get_invoice(invoice_id).state)
  end

  def test_read_first_three_lines_inv_2
    invoice_id = 'inv_2'
    @database.file_path = "../TestableCodeDemos/Module5/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    @invoice.total = 303.0
    invoice_state = false
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).content.total)
    assert_equal(invoice_state, @database.get_invoice(invoice_id).state)
  end

  def test_read_first_four_lines_inv_1
    invoice_id = 'inv_1'
    @database.file_path = "../TestableCodeDemos/Module5/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    @invoice.total = 30.0
    invoice_state = true
    expected_user = 'Michael'
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).content.total)
    assert_equal(invoice_state, @database.get_invoice(invoice_id).state)
    assert_equal(expected_user, @database.get_invoice(invoice_id).user)
  end

  def test_read_first_four_lines_inv_2
    invoice_id = 'inv_2'
    @database.file_path = "../TestableCodeDemos/Module5/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    @invoice.total = 303.0
    invoice_state = false
    expected_user = 'Rachel'
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).content.total)
    assert_equal(invoice_state, @database.get_invoice(invoice_id).state)
    assert_equal(expected_user, @database.get_invoice(invoice_id).user)
  end

  def test_read_first_five_lines_inv_1
    invoice_id = 'inv_1'
    @database.file_path = "../TestableCodeDemos/Module5/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    @invoice.total = 30.0
    invoice_state = true
    expected_user = 'Michael'
    expected_is_admin = true
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).content.total)
    assert_equal(invoice_state, @database.get_invoice(invoice_id).state)
    assert_equal(expected_user, @database.get_invoice(invoice_id).user)
    assert_equal(expected_is_admin, @database.get_invoice(invoice_id).is_admin)
  end

  def test_read_first_five_lines_inv_1
    invoice_id = 'inv_2'
    @database.file_path = "../TestableCodeDemos/Module5/invoices/#{invoice_id}.txt"
    @invoice.id = invoice_id
    @invoice.total = 303.0
    invoice_state = false
    expected_user = 'Rachel'
    expected_is_admin = false
    assert_equal(@invoice.id, @database.get_invoice(invoice_id).content.id)
    assert_equal(@invoice.total, @database.get_invoice(invoice_id).content.total)
    assert_equal(invoice_state, @database.get_invoice(invoice_id).state)
    assert_equal(expected_user, @database.get_invoice(invoice_id).user)
    assert_equal(expected_is_admin, @database.get_invoice(invoice_id).is_admin)
  end
end

