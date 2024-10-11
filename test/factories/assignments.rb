FactoryBot.define do
  factory :assignment do
    assigner_id { 1 }
    assignee_id { 1 }
    checklist_instance { nil }
    status { "MyString" }
  end
end
