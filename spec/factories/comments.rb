FactoryBot.define do
  factory :comment do
    feedback {Faker::Lorem.sentence}
    target   {Faker::Lorem.sentence}
    association :document
  end
end
