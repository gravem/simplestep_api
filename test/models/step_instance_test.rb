require "test_helper"

class StepInstanceTest < ActiveSupport::TestCase
  def setup
    @checklist_instance = FactoryBot.create(:checklist_instance)
    @step = FactoryBot.create(:step, checklist_template: @checklist_instance.checklist_template)
    @step_instance = StepInstance.new(step: @step, checklist_instance: @checklist_instance)
  end

  test "Factory should create valid step instance" do
    assert FactoryBot.create(:step_instance).valid?
  end

  test "StepInstance should be valid with valid attributes" do
    assert @step_instance.valid?
  end

  test "StepInstance should belong to a step" do
    assert_respond_to @step_instance, :step
  end

  test "StepInstance should belong to a checklist_instance" do
    assert_respond_to @step_instance, :checklist_instance
  end

  test "StepInstance should not be valid without a step" do
    @step_instance.step = nil
    assert_not @step_instance.valid?
  end

  test "StepInstance should not be valid without a checklist_instance" do
    @step_instance.checklist_instance = nil
    assert_not @step_instance.valid?
  end

  test "StepInstance can have a note" do
    @step_instance.note = "This is me monkey test note for a step instance"
    assert @step_instance.valid?
  end

  test "StepInstance can have no note" do
    @step_instance.note = nil
    assert @step_instance.valid?
  end

  test "StepInstance should be valid with different step and checklist_instance" do
    new_step = FactoryBot.create(:step, checklist_template: @checklist_instance.checklist_template)
    @step_instance.step = new_step
    assert @step_instance.valid?
  end
end
