FactoryBot.define do
  factory :user do
    family_name           { '苗字みょうじミョウジ' }
    first_name            { '名前なまえナマエ' }
    family_name_kana      { 'ミョウジ' }
    first_name_kana       { 'ナマエ' }
    company               { '株式会社123' }
    password              { '111aaa' }
    password_confirmation { password }
    email                 { Faker::Internet.free_email }
  end
end
