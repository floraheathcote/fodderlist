class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.references :meal_plan, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.boolean :favorite
      t.text :notes
      t.datetime :meal_date
      t.string :meal_type
      t.integer :portions

      t.timestamps
    end
  end
end
