FactoryBot.define do
  factory :step do
    association :checklist_template
    content { "Test step content" }
  end
end
