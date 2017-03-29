class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :time_start
      t.date :time_end
      t.string :image
      t.string :content
      t.integer :status, default: 0
      t.references :destination, foreign_key: true

      t.timestamps
    end
  end
end
