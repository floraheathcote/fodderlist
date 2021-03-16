class AddNotesToDay < ActiveRecord::Migration[6.0]
  def change
    add_column :days, :notes, :text
  end
end
