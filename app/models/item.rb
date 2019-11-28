class Item < ApplicationRecord
  validates :name, presence: true
  validates :discription, presence: true
  validates :price, presence: true

  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true

  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images

  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'

  has_many :item_category_relations, dependent: :destroy
  has_many :categories, through: :item_category_relations
  accepts_nested_attributes_for :item_category_relations

  def self.search(search)
    return Item.all unless search

    Item.where(['name LIKE ?', "%#{search}%"])
  end
end