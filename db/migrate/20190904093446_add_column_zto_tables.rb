class AddColumnZtoTables < ActiveRecord::Migration[5.2]
  def change
    add_column :versions, :z, :integer
    add_column :comments, :z, :integer
    add_column :color_swatches, :z, :integer
    add_column :versions, :canvas, :text
    add_column :comments, :canvas, :text
  end
end
