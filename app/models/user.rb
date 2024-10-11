class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :checklist_templates, dependent: :destroy
  has_many :checklist_instances, dependent: :destroy

  # User as the one who assigns checklists
  has_many :assigned_checklists, class_name: "Assignment", foreign_key: "assigner_id", dependent: :destroy

  # User as the one who receives assignments
  has_many :received_assignments, class_name: "Assignment", foreign_key: "assignee_id", dependent: :destroy
end
