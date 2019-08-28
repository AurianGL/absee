class AddCoordinatesToColorSwatches < ActiveRecord::Migration[5.2]
  def change
    add_column :color_swatches, :x, :string
    add_column :color_swatches, :y, :string
  end
end
