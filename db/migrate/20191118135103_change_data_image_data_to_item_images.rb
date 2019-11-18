class ChangeDataImageDataToItemImages < ActiveRecord::Migration[5.2]
  def change
    change_column :item_images, :image_data, :string
  end
end
