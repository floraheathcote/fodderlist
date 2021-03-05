class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :meal_type
      t.text :method
      t.decimal :default_qty, :default => 4
      t.string :default_unit, :default => "portions"
      t.text :notes

      t.timestamps
    end
  end
end
