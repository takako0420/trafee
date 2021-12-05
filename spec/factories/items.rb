FactoryBot.define do
  factory :item do
    text { Faker::Lorem.sentence }
    sheet nil
  end
end
