require "test_helper"
class UserTest < ActiveSupport::TestCase
  test "create a valid user" do
    user = User.new(name: "John", surname: "Doe", email: "john@example.com", password: "abc123ABC", password_confirmation: "abc123ABC")

    assert user.valid?
  end

  test "try to create invalid user without name" do
    user = User.new(surname: "Doe", email: "john@example.com", password: "abc123ABC", password_confirmation: "abc123ABC")

    assert user.invalid?
  end

  test "try to create invalid user without surname" do
    user = User.new(name: "John", email: "john@example.com", password: "abc123ABC", password_confirmation: "abc123ABC")

    assert user.invalid?
  end

  test "try to create invalid user without email" do
    user = User.new(name: "John", surname: "Doe", password: "abc123ABC", password_confirmation: "abc123ABC")

    assert user.invalid?
  end

  test "try to create invalid user without password" do
    user = User.new(name: "John", surname: "Doe", email: "john@example.com")

    assert user.invalid?
  end
end