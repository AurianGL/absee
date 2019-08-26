class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :version, foreign_key: true
      t.references :user, foreign_key: true
      t.text :description
      t.string :image_url
      t.boolean :validation

      t.timestamps
    end
  end
end
