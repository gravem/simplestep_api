require "test_helper"

class ChecklistTemplateTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.create(:user)
    @checklist_template = FactoryBot.build(:checklist_template, user: @user)
  end

  test "Cheklist template should be valid with valid attribures" do
    assert @checklist_template.valid?
  end

  test "Checklist template should not be valid without a title" do
    @checklist_template.title = nil
    assert_not @checklist_template.valid?
  end

  test "Checklist template should belong to a user" do
    assert_respond_to @checklist_template, :user
  end

  test "Checklist template should have many steps" do
    assert_respond_to @checklist_template, :steps
  end

  test "Checklist template should have many checklist instances" do
    assert_respond_to @checklist_template, :checklist_instances
  end
end
