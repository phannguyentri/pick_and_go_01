class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :content
      t.string :image
      t.integer :average_rate, default: 0
      t.string :latitude
      t.string :longtitude
      t.string :description
      t.integer :status, default: 0
      t.integer :count_arrived, default: 0
      t.integer :count_view, default: 0
      t.references :user, foreign_key: true
      t.references :destination, foreign_key: true

      t.timestamps
    end
  end
end
