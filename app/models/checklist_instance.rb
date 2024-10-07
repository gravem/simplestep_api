class ChecklistInstance < ApplicationRecord
  belongs_to :user
  belongs_to :checklist_template
  has_many :step_instances, dependent: :destroy

  validates :checklist_template_id, :user_id, presence: true

  # Adding scope for frequently used queries
  scope :completed, -> { where.not(completed_at: nil) }
  scope :in_progress, -> { where(completed_at: nil) }
end
