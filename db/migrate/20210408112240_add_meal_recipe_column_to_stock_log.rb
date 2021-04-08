class AddMealRecipeColumnToStockLog < ActiveRecord::Migration[6.0]
  def change
    add_reference :stock_logs, :meal_recipe, foreign_key: true
  end
end
