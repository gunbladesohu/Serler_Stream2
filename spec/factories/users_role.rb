require'faker'

FactoryGirl.define do
  factory :users_role do
    user_id "1"
    role_id "2"
    is_active true
  end
end
