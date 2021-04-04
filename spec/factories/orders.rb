FactoryBot.define do
  factory :order do
    postal_code { '123-4567' }
    address_id { 2 }
    municipality { '糟屋郡' }
    block_number { '桜丘1-1' }
    building_name { 'ワクワクハウス' }
    tel { '09012345678' }
  end
end
