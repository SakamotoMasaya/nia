class Category < ApplicationRecord
  has_many :item
  has_many :items, through: :item_category_relations
end
