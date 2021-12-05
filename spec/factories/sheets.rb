FactoryBot.define do
  factory :sheet do
    title { "スキルマップのタイトル" }
    association :user
  end

  factory :sheet_with_item, class: Sheet do
    title { "スキルマップのタイトル" }
    after( :create ) do |sheet|
      create :item, sheet: sheet
    end
  end
end