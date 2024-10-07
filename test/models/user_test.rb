require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.build(:user)
  end
  test "The user should be valid with valid attributes" do
    assert @user.valid?
  end

  test "User should not be valid without an email" do
    @user.email = nil
    assert_not @user.valid?
  end

  test "User should not be valid without a password" do
    @user.password = nil
    assert_not @user.valid?
  end

  test "User should have many checklist templates" do
    assert_respond_to @user, :checklist_templates
  end

  test "User should have many checklist instances" do
    assert_respond_to @user, :checklist_instances
  end
end
