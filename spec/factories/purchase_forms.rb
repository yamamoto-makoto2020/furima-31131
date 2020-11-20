FactoryBot.define do
  factory :purchase_form do
    postal_code   { '123-4567' }
    city          { '福岡市' }
    area_id       { 2 }
    house_number  { '中央区' }
    phone_number  { '09012345678' }
    token         { 'pk_test_000000aaaaa00aaaaaa00000' }
    user_id       { 8 }
    item_id       { 18 }
    purchase_id   { 1 }
  end
end
