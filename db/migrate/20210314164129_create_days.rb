class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.references :meal_plan, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
