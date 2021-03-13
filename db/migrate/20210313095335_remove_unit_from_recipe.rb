class RemoveUnitFromRecipe < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :default_unit, :string
    rename_column :recipes, :default_qty, :portions
  end
end
