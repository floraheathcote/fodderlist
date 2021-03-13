class AddNameToMeal < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :name, :string
  end
end
