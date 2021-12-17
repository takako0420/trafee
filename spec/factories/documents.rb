FactoryBot.define do
  factory :document do
    chose_one   {rand(10)}
    chose_two   {rand(10)}
    chose_three {rand(10)}
    chose_four  {rand(10)}
    association :user, :sheet
  end
end
