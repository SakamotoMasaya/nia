class CreateItemCategoryRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :item_category_relations do |t|
      t.integer :item_id
      t.integer :category_id

      t.timestamps
    end
  end
end
