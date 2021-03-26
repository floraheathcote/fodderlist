class AddHolidayToDay < ActiveRecord::Migration[6.0]
  def change
    add_column :days, :holiday, :string
  end
end
