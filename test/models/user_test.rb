require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "it's valid user name" do
    assert users(:one).valid?
  end

  test "it's not valid user name" do
    user = users(:two)
    user.name = nil
    assert_not user.valid?
  end

  test "it's not valid user email format" do
    user = users(:one)
    user.email = 'anystring.com'
    assert_not user.valid?
  end

end
