include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :prototype_image do
    image { fixture_file_upload("spec/fixtures/img/sample.png") }

    trait :main do
      property :main
    end

    trait :sub do
      property :sub
    end
  end
end
