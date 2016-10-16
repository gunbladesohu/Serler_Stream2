require'faker'

FactoryGirl.define do
  factory :role do
    name "Admin"
    is_active true
  end
end
