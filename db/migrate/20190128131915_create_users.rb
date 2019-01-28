class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :string
      t.string :is_admin
      t.string :boolean

      t.timestamps
    end
  end
end
