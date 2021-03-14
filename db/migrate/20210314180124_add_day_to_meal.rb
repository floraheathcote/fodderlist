class AddDayToMeal < ActiveRecord::Migration[6.0]
  def change
    add_reference :meals, :day, null: false, foreign_key: true
  end
end
