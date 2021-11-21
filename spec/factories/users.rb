FactoryBot.define do
  factory :user do
    family_name           { '苗字みょうじミョウジ' }
    first_name            { '名前なまえナマエ' }
    family_name_kana      { 'ミョウジ' }
    first_name_kana       { 'ナマエ' }
    company               { '株式会社123' }
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 4,max_length: 30) }
    password_confirmation {password}
  end
end