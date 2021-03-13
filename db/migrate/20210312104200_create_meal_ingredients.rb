class CreateMealIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_ingredients do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.decimal :quantity
      t.string :unit

      t.timestamps
    end
  end
end
