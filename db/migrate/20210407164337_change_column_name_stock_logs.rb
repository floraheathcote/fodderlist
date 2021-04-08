class ChangeColumnNameStockLogs < ActiveRecord::Migration[6.0]
  def change
    rename_column :stock_logs, :quantity, :portions
  end
end
