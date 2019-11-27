class RemoveImageDataFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :image_data, :text
    remove_column :items, :images, :json
  end
end
