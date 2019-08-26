class CreateColorSwatches < ActiveRecord::Migration[5.2]
  def change
    create_table :color_swatches do |t|
      t.string :color_1
      t.string :color_2
      t.string :color_3
      t.string :color_4
      t.string :color_5
      t.references :version, foreign_key: true
      t.references :artist_as, index: true, foreign_key: {to_table: :users}
      t.boolean :validation

      t.timestamps
    end
  end
end
