class FixProdessingColumnName < ActiveRecord::Migration[6.0]
  def change
  rename_column :carts, :prodessing, :processing

  end
end
