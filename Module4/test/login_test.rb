require 'minitest/autorun'

require_relative '../Shared/login'

class LoginTest < Minitest::Test
  include Module4

  def setup
    @username = 'a-username'
  end
  def test_create_login
    expected_user = User.new(@username)

    login = Login.new(User.new(@username))

    assert_equal(expected_user.username, login.user.username)
  end

  def test_cannot_change_user
    another_username = 'another-username'

    login = Login.new(User.new(@username))

    assert_raises NoMethodError do
      login.user = User.new(another_username)
    end
  end


end

