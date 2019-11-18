class CreateItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_images do |t|
      t.integer :item_id
      t.text :image

      t.timestamps
    end
  end
end
