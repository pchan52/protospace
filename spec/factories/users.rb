FactoryGirl.define do
  factory :user do
    password = Faker::Internet.password(8)
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password password
    password_confirmation password
    profile { Faker::Hacker.say_something_smart }
    member { Faker::Company.profession }
    works { Faker::Company.catch_phrase }
    avatar { Faker::Avatar.image}
  end
end
