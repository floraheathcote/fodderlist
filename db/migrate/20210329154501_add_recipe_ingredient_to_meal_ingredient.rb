class AddRecipeIngredientToMealIngredient < ActiveRecord::Migration[6.0]
  def change
    add_reference :meal_ingredients, :recipe_ingredient, foreign_key: true
  end
end
