class AddFirstReadingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_reading, :string, null: false, default: ""
  end
end
