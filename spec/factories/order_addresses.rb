FactoryBot.define do
  factory :order_address do
    token { 'token' }
    postal_code { '000-0000' }
    prefecture_id { 2 }
    city { '札幌市' }
    house_number { '郡山1-1-1' }
    tel { '00000000000' }
    association :user
    association :item
  end
end
