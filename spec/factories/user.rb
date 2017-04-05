FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    first_name 'Ben'
    last_name 'Kinney'
    password '123123'
    password_confirmation '123123'
    signature 'Hey Hey'
  end
end
