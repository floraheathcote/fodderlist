class AddDaysToMealPlan < ActiveRecord::Migration[6.0]
  def change
    add_column :meal_plans, :number_of_days, :int
  end
end
