class Assignment < ApplicationRecord
  # Remember to pay close attention to assignER vs assignEE
  belongs_to :assigner, class_name: "user"
  belongs_to :assignee, class_name: "user"
  belongs_to :checklist_instance

  # Validations
  validates :assigner_id, presence: true
  validates :assignee_id, presence: true
  validates :checklist_instance_id, presence: true
  validates :status, presence: true
end
