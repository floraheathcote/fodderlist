class CreateStockLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.datetime :datetime
      t.decimal :quantity

      t.timestamps
    end
  end
end
