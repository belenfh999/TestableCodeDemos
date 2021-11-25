require 'minitest/autorun'

require_relative '../../Shared/login'
require_relative '../../Shared/session'

class SessionTest < Minitest::Test
  include Module4

  def setup
    @user = User.new('a-username')
  end
  def test_create_login
    expected_login = Login.new(@user)

    login = Login.new(User.new('a-username'))

    assert_equal(expected_login, login)
  end

  def test_cannot_change_user
    another_user = User.new('another-username')

    login = Login.new(User.new(@username))

    assert_raises NoMethodError do
      login.user = another_user
    end
  end
end

