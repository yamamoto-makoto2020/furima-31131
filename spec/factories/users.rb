FactoryBot.define do
  factory :user do
    nickname              { 'aaa' }
    email                 { 'aaa@aaa' }
    password              { '12345a' }
    password_confirmation { '12345a' }
    family_name           { '竈門' }
    last_name             { '炭治郎' }
    family_name_kana      { 'カマド' }
    last_name_kana        { 'タンジロウ' }
    birthday              { '1900-01-01' }
  end
end
