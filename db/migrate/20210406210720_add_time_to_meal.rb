class AddTimeToMeal < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :time, :datetime
  end
end
