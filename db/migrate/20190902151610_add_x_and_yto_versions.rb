class AddXAndYtoVersions < ActiveRecord::Migration[5.2]
  def change
    add_column :versions, :x, :string
    add_column :versions, :y, :string
  end
end
