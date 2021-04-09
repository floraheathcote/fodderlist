class CreateLeftovers < ActiveRecord::Migration[6.0]
  def change
    create_table :leftovers do |t|
      t.references :meal_recipe, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :max_portions
      t.decimal :stock_level
      t.datetime :date_made

      t.timestamps
    end
  end
end
