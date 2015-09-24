FactoryGirl.define do
  factory :user do
    email 'sample@example.com'
    password 'password'
    password_confirmation 'password'

    trait :confirmed do
      confirmed_at { Time.now }
    end
  end
end
