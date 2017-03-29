class CreateSuggests < ActiveRecord::Migration[5.0]
  def change
    create_table :suggests do |t|
      t.string :title
      t.string :content
      t.integer :status, default: 0
      t.references :destination, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
