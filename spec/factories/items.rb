FactoryBot.define do
  factory :item do
    title            {"furima"}
    price            {"1100"}
    explanation      {"furimanosetumei"}
    area_id          {2}
    category_id      {2}
    delivery_free_id {2}
    guideline_id     {2}
    status_id        {2}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end