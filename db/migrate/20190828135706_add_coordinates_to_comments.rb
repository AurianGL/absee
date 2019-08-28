class AddCoordinatesToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :x, :string
    add_column :comments, :y, :string
  end
end
