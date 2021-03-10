class RemoveRecipeIdFromRecipeIngredient < ActiveRecord::Migration[6.0]
  def change
    remove_reference :recipe_ingredients, :recipe, null: false, foreign_key: true
  end
end
