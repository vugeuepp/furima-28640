class AddNamesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_name, :string, null: false
    add_column :items, :about, :text, null: false
  end
end

