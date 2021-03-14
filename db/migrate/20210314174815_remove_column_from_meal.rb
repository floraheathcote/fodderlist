class RemoveColumnFromMeal < ActiveRecord::Migration[6.0]
  def change
    remove_reference :meals, :meal_plan, null: false, foreign_key: true
    
  end
end
