require'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'admin123'

    factory :admin do
      admin true
    end
  end
end
