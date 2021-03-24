class CreateShoppingListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_list_items do |t|
      t.references :meal_plan, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.decimal :sum_qty
      t.string :unit
      t.boolean :ticked

      t.timestamps
    end
  end
end
