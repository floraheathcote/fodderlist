class AddPortionToMealRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :meal_recipes, :portions, :decimal
  end
end
