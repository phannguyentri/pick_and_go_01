class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :image
      t.string :content
      t.string :description
      t.integer :status, default: 0
      t.integer :average_rate, default: 0
      t.integer :count_view, default: 0

      t.timestamps
    end
  end
end
