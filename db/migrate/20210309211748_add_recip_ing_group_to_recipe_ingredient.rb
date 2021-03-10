class AddRecipIngGroupToRecipeIngredient < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipe_ingredients, :recipe_ingredient_group, null: false, foreign_key: true, default: 1
  end
end
