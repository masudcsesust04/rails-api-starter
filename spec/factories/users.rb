FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email 'admin@example.com'
    password '11111111'
  end
end