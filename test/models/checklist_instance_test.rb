require "test_helper"

class ChecklistInstanceTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.create(:user)
    @template = FactoryBot.create(:checklist_template, user: @user)
    @checklist_instance = ChecklistInstance.new(user: @user, checklist_template: @template)
  end

  test "A checklist instance should be valid with valid attributes" do
    assert @checklist_instance.valid?
  end

  test "checklist instance should not be valid without a user" do
    @checklist_instance.user = nil
    assert_not @checklist_instance.valid?
  end

  test "checklist instance should not be valid without a checklist_template" do
    @checklist_instance.checklist_template = nil
    assert_not @checklist_instance.valid?
  end

  test "Completed scope should return only completed instances and in-progress chould only return in-progress instances" do
    completed_instance = FactoryBot.create(:checklist_instance, completed_at: Time.current)
    in_progress_instance = FactoryBot.create(:checklist_instance, completed_at: nil)

    assert_includes ChecklistInstance.completed, completed_instance
    assert_not_includes ChecklistInstance.completed, in_progress_instance

    assert_includes ChecklistInstance.in_progress, in_progress_instance
    assert_not_includes ChecklistInstance.in_progress, completed_instance
  end

  test "Checklist instance should not save without title" do
    checklist_instance = ChecklistInstance.new
    assert_not checklist_instance.save
  end
end
