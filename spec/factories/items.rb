FactoryBot.define do
  factory :item do
    item_name { 'カメラ' }
    text {Faker::Lorem.sentence}
    category_id { 2 }
    status_id { 2 }
    fee_id { 2 }
    prefecture_id { 2 }
    delivery_id { 2 }
    price { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'camera.png')
    end
  end
end
