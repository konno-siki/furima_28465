class Address < ApplicationRecord
  belongs_to_active_hash :prefecture
  belongs_to :order

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
    validates :city
    validates :house_number
    validates :tel
  end
end
