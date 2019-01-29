class RemoveBooleanFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :boolean 
    remove_column :users, :is_admin
    add_column :users, :is_admin, :boolean
  end
end
