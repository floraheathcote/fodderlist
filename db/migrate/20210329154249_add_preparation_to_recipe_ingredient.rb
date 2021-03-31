class AddPreparationToRecipeIngredient < ActiveRecord::Migration[6.0]
  def change
    add_column :recipe_ingredients, :preparation, :string
  end
end
