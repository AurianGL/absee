class ChangeDefaultOfDIsplayInComments < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:comments, :display, 'false')
  end
end
