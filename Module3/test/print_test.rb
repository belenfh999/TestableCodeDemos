require 'rubygems'
gem 'mocha'
gem 'minitest'
require 'minitest/autorun'
require 'minitest/unit'
require 'mocha/minitest'

require_relative '../common/database'
require_relative '../common/invoice'
require_relative '../common/date_time_wrapper'
require_relative '../common/printer'
require_relative '../lib/Hard/print'

class PrintTest < Minitest::Test
  include Module3

  def setup
    @invoice = Invoice.new
    @invoice.id = 'inv_1'
    @invoice.total = 499.95

    @printer = Printer.new
    Time.stubs(:now).returns(Time.new(2021, 11, 14))
    @stubbed_date = DateTimeWrapper.new
    @database = Database.new
    @print_command = PrintInvoiceCommand.new(@database, @printer, @stubbed_date)
  end

  def test_print_inv1
    expected_invoice = "Invoice ID: inv_1"
    expected_total = "Total: $499.95"
    expected_date = "Printed: 2021-11-14 00:00:00 +0100"


    @database.stubs(:get_invoice).returns(@invoice)
    @print_command.printer.expects(:puts).with(expected_invoice).once
    @print_command.printer.expects(:puts).with(expected_total).once
    @print_command.printer.expects(:puts).with(expected_date).once

    @print_command.execute(@invoice.id)
  end

  def test_print_inv2
    @invoice.id = 'inv_2'
    @invoice.total = 303.0
    expected_invoice = "Invoice ID: inv_2"
    expected_total = "Total: $303.0"
    expected_date = "Printed: 2021-11-14 00:00:00 +0100"

    @database.stubs(:get_invoice).returns(@invoice)
    @print_command.printer.expects(:puts).with(expected_invoice).once
    @print_command.printer.expects(:puts).with(expected_total).once
    @print_command.printer.expects(:puts).with(expected_date).once

    @print_command.execute(@invoice.id)
  end
end

