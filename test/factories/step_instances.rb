FactoryBot.define do
  factory :step_instance do
    association :step
    association :checklist_instance
    note { nil }
  end
end
