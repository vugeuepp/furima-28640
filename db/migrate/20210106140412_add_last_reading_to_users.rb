class AddLastReadingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_reading, :string, null: false, default: ""
  end
end
