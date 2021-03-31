class AddPreparationToMealIngredient < ActiveRecord::Migration[6.0]
  def change
    add_column :meal_ingredients, :preparation, :string
  end
end
