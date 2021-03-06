class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: /\A[\w.]+@[a-z\d.-]+\.[a-zA-Z0-9-]+\z/ }
  validates :password, length: { in: 7..50 }, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/ }
  # 文字列の開始位置　a-zA-Zを含むかつ\dを含む a-zA-z\dの中から　文字列の終了位置

  has_secure_password

  has_many :seller_items, -> { where('buyer_id is NULL') }, class_name: 'Items', foreign_key: 'seller_id'
  has_many :sold_items, -> { where('buyer_id is not NULL') }, class_name: 'Items', foreign_key: 'seller_id'
  has_many :buyer_items, class_name: 'Items', foreign_key: 'buyer_id'

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  has_many :items
  has_many :favorites
  has_many :favorite_items, through: :favorites, source: 'item'
end
