require 'minitest/autorun'

require_relative '../../Shared/user'

class UserTest < Minitest::Test
  include Module4

  def test_create_user
    expected_username = 'a-username'

    user = User.new(expected_username)

    assert_equal(expected_username, user.username)
  end

  def test_cannot_change_username
    initial_name = 'a-username'
    modified_username = 'another-username'

    user = User.new(initial_name)

    assert_raises NoMethodError do
      user.username = modified_username
    end
  end


end

