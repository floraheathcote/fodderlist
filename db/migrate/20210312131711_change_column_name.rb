class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipe_ingredients, :default_amount, :portions
  end
end
