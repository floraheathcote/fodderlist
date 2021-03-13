class AddUnitToRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :recipe_ingredients, :unit, :string
    rename_column :recipe_ingredients, :portions, :default_amount
  end
end
