class RemoveStartDateFromMealPlan < ActiveRecord::Migration[6.0]
  def change
    remove_column :meal_plans, :start_date, :datetime
    remove_column :meal_plans, :number_of_days, :int
  end
end
