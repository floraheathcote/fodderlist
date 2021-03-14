class RemoveDateFromMeal < ActiveRecord::Migration[6.0]
  def change
    remove_column :meals, :meal_date, :datetime
  end
end
