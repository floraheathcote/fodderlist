class AddMealPlanAgain < ActiveRecord::Migration[6.0]
  def change
    add_reference :meal_ingredients, :meal_plan, foreign_key: true
  end
end
