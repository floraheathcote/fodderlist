class CreateMealWithLeftovers < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_with_leftovers do |t|
      t.references :leftovers, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true
      t.decimal :portions

      t.timestamps
    end
  end
end
