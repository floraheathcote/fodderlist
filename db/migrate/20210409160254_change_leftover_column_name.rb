class ChangeLeftoverColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :meal_with_leftovers, :leftovers_id, :leftover_id
  
  end
end
