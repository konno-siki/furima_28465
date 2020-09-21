class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :text
    validates :category_id, numericality: { other_than: 1, message: "Select"}
    validates :status_id, numericality: { other_than: 1, message: "Select"}
    validates :fee_id, numericality: { other_than: 1, message: "Select"}
    validates :prefecture_id, numericality: { other_than: 1, message: "Select"}
    validates :delivery_id, numericality: { other_than: 1, message: "Select"}
    validates :price, numericality: { with: /\A[0-9]+\z/, message: "Half-width number"}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
  end

end
