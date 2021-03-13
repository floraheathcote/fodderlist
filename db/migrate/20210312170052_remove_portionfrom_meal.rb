class RemovePortionfromMeal < ActiveRecord::Migration[6.0]
  def change
    remove_column :meals, :portions
  end
end
