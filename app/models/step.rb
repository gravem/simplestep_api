class Step < ApplicationRecord
  belongs_to :checklist_template

  has_many :step_instances, dependent: destroy

  validates :content, presence: true
end
