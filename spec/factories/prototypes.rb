FactoryGirl.define do
  factory :prototype do
    name       { Faker::Name.name }
    catch_copy  { Faker::Lorem.word }
    concept     { Faker::Lorem.sentence }
    created_at  { Faker::Time.between(2.days.ago, Time.now) }
  end
end
