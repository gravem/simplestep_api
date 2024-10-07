FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "monkey#{n}@testmonkey.com" }
    password { "MonkeyPassword123!" }
  end
end
