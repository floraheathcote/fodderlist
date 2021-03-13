class AddMealRecipeToMealIngredient < ActiveRecord::Migration[6.0]
  def change
    add_reference :meal_ingredients, :meal_recipe, foreign_key: true
  end
end
