FactoryGirl.define do
  factory :task do
    name { Faker::StarWars.character }
    done false
    todo_id nil
  end
end