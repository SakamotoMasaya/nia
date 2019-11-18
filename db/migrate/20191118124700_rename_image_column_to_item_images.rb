class RenameImageColumnToItemImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :item_images, :image, :image_data
  end
end
