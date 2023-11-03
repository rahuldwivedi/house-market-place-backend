
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password123' }

    trait :admin do
      type { 'Admin' }
    end

    trait :user do
      type { 'User' }
    end
  end
end
