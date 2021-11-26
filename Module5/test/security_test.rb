require 'minitest/autorun'
require_relative '../lib/Hard/security'

class SecurityTest < Minitest::Test
  include Module5
  def setup
    @security = Module5::Security.new
    @username = "Chris"
    @is_admin = true
  end

  def test_create_singleton_instance
    assert_instance_of(Security, Security.get_instance)
  end

  def test_user_is_set_correctly_1
    @security.set_user(@username, @is_admin)

    assert_equal(@username, @security.username)
    assert_equal(@is_admin, @security.is_admin)
  end

  def test_user_is_set_correctly_2
    @username = "Andy"
    @is_admin = true
    @security.set_user(@username, @is_admin)

    assert_equal(@username, @security.username)
    assert_equal(@is_admin, @security.is_admin)
  end
end
