class ChangeImageNameToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :image_url, :image
  end
end
