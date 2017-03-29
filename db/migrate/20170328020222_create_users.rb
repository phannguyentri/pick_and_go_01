class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone
      t.string :info
      t.string :image
      t.string :password_digest
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
