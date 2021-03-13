class RemoveRecipeFromMeal < ActiveRecord::Migration[6.0]
  def change
    remove_column :meals, :recipe_id
  end
end
