FactoryGirl.define do
  factory :comment do
    comment { Faker::Lorem.sentence }
    user
    prototype
  end
end
