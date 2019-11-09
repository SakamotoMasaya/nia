class Item < ApplicationRecord
  validates :description, presence: true
  validates :seller_id, presence: true
  validates :buyer_id, presence: true

  belogs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belogs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
end
