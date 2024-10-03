class StepInstance < ApplicationRecord
  belongs_to :checklist_instance
  belongs_to :step
end
