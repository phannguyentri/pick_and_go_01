class CreateCulturals < ActiveRecord::Migration[5.0]
  def change
    create_table :culturals do |t|
      t.string :title
      t.string :content
      t.string :image
      t.integer :status, default: 0
      t.references :user, foreign_key: true
      t.references :destination, foreign_key: true

      t.timestamps
    end
  end
end
