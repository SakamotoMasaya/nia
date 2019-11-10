class Item < ApplicationRecord
  include ImageUploader[:image]
  validates :name, presence: true
  validates :discription, presence: true
  validates :price, presence: true

  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true
end
