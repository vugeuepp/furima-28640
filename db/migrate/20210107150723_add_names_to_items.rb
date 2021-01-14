class AddNamesToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :category_id, :integer, null: false
    add_column :items, :condition_id, :integer, null: false
    add_column :items, :shipping_id, :integer, null: false
    add_column :items, :prefecture_id, :integer, null: false
    add_column :items, :day_id, :integer, null: false
    add_column :items, :price, :integer, null: false
    add_reference :items, :user, null: false, foreign_key: true
  end
end
