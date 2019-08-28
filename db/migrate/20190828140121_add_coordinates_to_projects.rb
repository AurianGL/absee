class AddCoordinatesToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :x, :string
    add_column :projects, :y, :string
  end
end
