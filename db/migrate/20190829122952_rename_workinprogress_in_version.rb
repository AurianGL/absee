class RenameWorkinprogressInVersion < ActiveRecord::Migration[5.2]
  def change
    rename_column :versions, :work_in_progress, :photo
  end
end
