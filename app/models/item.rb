class Item < ApplicationRecord
  validates :name, presence: true
  validates :discription, presence: true
  validates :price, presence: true

  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true

  has_many :item_image, dependent: :destroy
  accepts_nested_attributes_for :item_image
end
