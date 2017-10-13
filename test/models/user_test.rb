require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user is invalid without a name' do
    user = User.new name: 'Jesús', role: :admin
    assert user.valid?

    user = User.new name: nil
    assert user.invalid?
  end

  test 'user is invalid without a role' do
    user = User.new name: 'Jesús', role: :admin
    assert user.valid?

    user.role = nil
    assert user.invalid?
  end

  test 'user is invalid with a role not included in the ROLES list' do
    user = User.new name: 'Jesús', role: :admin
    assert user.valid?

    allowed_roles = User::ROLES
    invalid_role = 'invalid_role'
    refute_includes allowed_roles, invalid_role

    user.role = invalid_role
    assert user.invalid?
  end
end
