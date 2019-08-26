class CreateVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :versions do |t|
      t.references :project, foreign_key: true
      t.string :work_in_progress

      t.timestamps
    end
  end
end
