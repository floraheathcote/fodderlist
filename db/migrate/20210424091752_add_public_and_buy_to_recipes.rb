class AddPublicAndBuyToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :public, :boolean
    add_column :recipes, :buy_link, :string
  end
end
