class RemoveUnitFromRecipeIngredient < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipe_ingredients, :unit
  end
end
