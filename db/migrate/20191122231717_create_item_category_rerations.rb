class CreateItemCategoryRerations < ActiveRecord::Migration[5.2]
  def change
    create_table :item_category_rerations do |t|
      t.integer :item_id
      t.integer :category_id

      t.timestamps
    end
  end
end
