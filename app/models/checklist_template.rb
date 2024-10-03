class ChecklistTemplate < ApplicationRecord
  belongs_to :user

  has_many :steps, dependent: :destroy
  has_many :checklist_instances, dependent: :destroy

  validates :title, presence: true
end
