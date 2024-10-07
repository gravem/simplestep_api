FactoryBot.define do
  factory :checklist_template do
    association :user # Associate the checklist with the user
    title { "TestMonkey's Test Checklist Template" }
  end
end
