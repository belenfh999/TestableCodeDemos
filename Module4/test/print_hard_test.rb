require 'rubygems'
gem 'mocha'
gem 'minitest'
require 'minitest/autorun'
require 'minitest/unit'
require 'mocha/minitest'
require 'ostruct'

require_relative '../Shared/container'
require_relative '../Shared/database'
require_relative '../Shared/invoice'
require_relative '../Shared/printer'
require_relative '../Shared/date_time_wrapper'
require_relative '../Shared/invoice_writer'
require_relative '../Shared/session'
require_relative '../Shared/login'
require_relative '../Shared/user'
require_relative '../lib/Hard/print'

class PrintHardTest < Minitest::Test
  include Module4

  def setup
    @session = Session.new(Login.new(User.new("Arthur")))
    Time.stubs(:now).returns(Time.new(2021, 11, 14))
    @stubbed_date = Module4::DateTimeWrapper.new
    @database = Module4::Database.new

    @invoice = OpenStruct.new
    @invoice.content = Module4::Invoice.new
  end

  def test_print_inv1
    set_invoice('inv_1', 499.95,true)
    set_print_invoice_command('red')
    expected_invoice = "\e[0;31;49mInvoice ID: inv_1\e[0m" #"\e[0;31;49m something \e[0m" <- prints in red
    expected_total = "\e[0;31;49mTotal: $499.95\e[0m"
    expected_date = "\e[0;31;49mPrinted on: 2021-11-14 00:00:00 +0100\e[0m"
    expected_user = "\e[0;31;49mPrinted by: Arthur\e[0m"
    expected_username = "Arthur"
    expected_color = 'red'

    @database.stubs(:get_invoice).returns(@invoice)
    @database.stubs(:puts)
    printer = @print_command.container[:invoice_writer].printer
    printer.expects(:puts).with(expected_invoice).once
    printer.expects(:puts).with(expected_total).once
    printer.expects(:puts).with(expected_date).once
    printer.expects(:puts).with(expected_user).once
    assert_equal(expected_color, printer.page_layout.color)
    assert_equal(expected_username, @print_command.container[:session].login.user.username)

    @print_command.execute(@invoice.id)
  end

  def test_print_inv2
    set_invoice('inv_2',303.0,false)
    @session = Session.new(Login.new(User.new("Eva")))
    set_print_invoice_command('default')
    expected_invoice = "Invoice ID: inv_2"
    expected_total = "Total: $303.0"
    expected_date = "Printed on: 2021-11-14 00:00:00 +0100"
      expected_user = "Printed by: Eva"
      expected_username = "Eva"
    expected_color = 'default'

    @database.stubs(:get_invoice).returns(@invoice)
    @database.stubs(:puts)
    printer = @print_command.container[:invoice_writer].printer
    printer.expects(:puts).with(expected_invoice).once
    printer.expects(:puts).with(expected_total).once
    printer.expects(:puts).with(expected_date).once
    printer.expects(:puts).with(expected_user).once
    assert_equal(expected_color, printer.page_layout.color)
    assert_equal(expected_username, @print_command.container[:session].login.user.username)

    @print_command.execute(@invoice.id)
  end

  private
  def set_print_invoice_command(color)
    printer = Module4::Printer.new
    page_layout = Module4::PageLayout.new
    printer.set_page_layout(page_layout)
    printer.set_ink_color(color)
    c = Module4::Container.new do |c|
      c[:database] = @database
      c[:invoice_writer] = Module4::InvoiceWriter.new(printer, page_layout, @stubbed_date)
      c[:session] = @session
    end

    @print_command = Module4::PrintHardInvoiceCommand.new(c)
  end

  def set_invoice(invoice_id, total, state)
    @invoice.content.id = invoice_id
    @invoice.content.total = total
    @invoice.state = state
  end
end

