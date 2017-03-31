class ChangeTypeConlumnTables < ActiveRecord::Migration[5.0]
  def change
    change_column :locations, :content, :text
    change_column :culturals, :content, :text
    change_column :posts, :content, :text
  end
end
