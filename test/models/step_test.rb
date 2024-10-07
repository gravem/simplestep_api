require "test_helper"

class StepTest < ActiveSupport::TestCase
  def setup
    @checklist_template = FactoryBot.create(:checklist_template)
    @step = Step.new(content: "Test a banana", checklist_template: @checklist_template)
  end
  test "A step should be valid with vaild attributes" do
    assert @step.valid?
  end

  test "Step should not be valid without content" do
    @step.content = nil
    assert_not @step.valid?
  end

  test "step should belong to a checklist_template" do
    assert_respond_to @step, :checklist_template
  end

  test "step should have many step instances" do
    assert_respond_to @step, :step_instances
  end
end
