class ItemImage < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :item, optional: true
end
