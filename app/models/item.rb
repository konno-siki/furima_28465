class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :text
    validates :category
    validates :status
    validates :fee
    validates :prefecture
    validates :delivery
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}, 
    format: { with: /\A[0-9]+\z/, message: "Please enter in single-byte number"}
  end

end
