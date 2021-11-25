require 'rubygems'
gem 'mocha'
gem 'minitest'
require 'minitest/autorun'
require 'minitest/unit'
require 'mocha/minitest'
require 'ostruct'

require_relative '../common/database'
require_relative '../common/invoice'
require_relative '../common/date_time_wrapper'
require_relative '../common/printer'
require_relative '../lib/Hard/print'

class PrintHardTest < Minitest::Test
  include Module3

  def setup
    @invoice = OpenStruct.new
    @invoice.content = Invoice.new

    Time.stubs(:now).returns(Time.new(2021, 11, 14))
    @stubbed_date = DateTimeWrapper.new
    @database = Database.new
  end

  def test_print_inv1
    set_invoice('inv_1', 499.95,true)
    set_print_invoice_command('red')
    expected_invoice = "\e[0;31;49mInvoice ID: inv_1\e[0m" #"\e[0;31;49m something \e[0m" <- prints in red
    expected_total = "\e[0;31;49mTotal: $499.95\e[0m"
    expected_date = "\e[0;31;49mPrinted: 2021-11-14 00:00:00 +0100\e[0m"
    expected_color = 'red'

    @database.stubs(:get_invoice).returns(@invoice)
    @print_command.printer.expects(:puts).with(expected_invoice).once
    @print_command.printer.expects(:puts).with(expected_total).once
    @print_command.printer.expects(:puts).with(expected_date).once
    assert_equal(expected_color, @print_command.printer.page_layout.color)

    @print_command.execute(@invoice.id)
  end

  def test_print_inv2
    set_invoice('inv_2',303.0,false)
    set_print_invoice_command('default')
    expected_invoice = "Invoice ID: inv_2"
    expected_total = "Total: $303.0"
    expected_date = "Printed: 2021-11-14 00:00:00 +0100"
    expected_color = 'default'

    @database.stubs(:get_invoice).returns(@invoice)
    @print_command.printer.expects(:puts).with(expected_invoice).once
    @print_command.printer.expects(:puts).with(expected_total).once
    @print_command.printer.expects(:puts).with(expected_date).once
    assert_equal(expected_color, @print_command.printer.page_layout.color)

    @print_command.execute(@invoice.id)
  end

  private
  def set_print_invoice_command(color)
    printer = Printer.new
    printer.set_page_layout(PageLayout.new)
    printer.set_ink_color(color)
    @print_command = PrintInvoiceCommandHard.new(@database, printer, @stubbed_date)
  end

  def set_invoice(invoice_id, total, state)
    @invoice.content.id = invoice_id
    @invoice.content.total = total
    @invoice.state = state
  end
end

