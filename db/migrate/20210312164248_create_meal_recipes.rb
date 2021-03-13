class CreateMealRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_recipes do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
