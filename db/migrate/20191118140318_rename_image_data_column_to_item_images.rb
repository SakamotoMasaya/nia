class RenameImageDataColumnToItemImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :item_images, :image_data, :image
  end
end
