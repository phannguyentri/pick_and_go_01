class AddAndFixColumnToDestination < ActiveRecord::Migration[5.0]
  def change
    add_column :destinations, :place_id, :string
    change_column :destinations, :content, :text
    change_column :destinations, :description, :text
  end
end
