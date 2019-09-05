class AddSizeToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :width, :integer
    add_column :comments, :height, :integer
  end
end
