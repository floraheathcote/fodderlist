class ChangeColumnNameNotesinRecipe < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :notes, :view_link
  end
end
