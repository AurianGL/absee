class AddDisplayToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :versions, :size, :string, default: "medium"
    add_column :comments, :size, :string, default: "medium"
    add_column :color_swatches, :size, :string, default: "medium"
    add_column :versions, :display, :boolean, default: true
    add_column :comments, :display, :boolean, default: true
    add_column :color_swatches, :display, :boolean, default: true
  end
end
