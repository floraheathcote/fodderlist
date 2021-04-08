class AddMealColumnToStockLog < ActiveRecord::Migration[6.0]
  def change
    add_reference :stock_logs, :meal, foreign_key: true
  end
end
