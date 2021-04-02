class ChangeColumnNameInRecipeIngredient < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipe_ingredients, :default_amount, :quantity
  end
end
