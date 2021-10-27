require 'minitest/autorun'
require_relative '../lib/easy_to_test_program'
class EasyToTestProgramTest < Minitest::Test
  include Module1
  def setup
    @programClass = EasyToTestProgram.new
  end

  def test_empty_total
    parts = 0
    service = 0
    discount = 0
    expected_total = 0
    assert_equal(expected_total, @programClass.program(parts, service, discount))
  end

  def test_total_with_only_parts
    parts = 10
    service = 0
    discount = 0
    expected_total = 10
    assert_equal(expected_total, @programClass.program(parts, service, discount))
  end

  def test_total_with_only_service
    parts = 0
    service = 20
    discount = 0
    expected_total = 20
    assert_equal(expected_total, @programClass.program(parts, service, discount))
  end

  def test_total_with_parts_and_service
    parts = 10
    service = 20
    discount = 0
    expected_total = 30
    assert_equal(expected_total, @programClass.program(parts, service, discount))
  end

  def test_total_with_all_fields
    parts = 10
    service = 20
    discount = 10
    expected_total = 20
    assert_equal(expected_total, @programClass.program(parts, service, discount))
  end
end