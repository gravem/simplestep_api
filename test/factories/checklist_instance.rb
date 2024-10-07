FactoryBot.define do
  factory :checklist_instance do
    association :user # Associate the checklist with the user
    association :checklist_template
    completed_at { nil }
  end
end
