class AddColumnToShoppingListItem < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_list_items, :total_sum_unit, :string
    remove_column :shopping_list_items, :sum_qty, :decimal
    remove_column :shopping_list_items, :unit, :string
  end
end