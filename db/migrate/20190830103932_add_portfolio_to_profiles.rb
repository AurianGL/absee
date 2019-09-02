class AddPortfolioToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :portfolio, :string
  end
end
