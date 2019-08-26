class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references :customer, index: true, foreign_key: {to_table: :users}
      t.references :artist, index: true, foreign_key: {to_table: :users}
      t.text :brief

      t.timestamps
    end
  end
end
