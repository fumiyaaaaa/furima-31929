FactoryBot.define do
  factory :item do
    item_name        { "オムライス" }
    text             { "アイウエオ" }
    category_id      { 2 }
    status_id        { 2 }
    delivery_cost_id { 2 }
    address_id       { 2 }
    shipping_day_id  { 2 }
    price            { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io:File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
