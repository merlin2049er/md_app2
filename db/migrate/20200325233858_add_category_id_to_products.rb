class AddCategoryIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :category_id, :integer # Only if using reconfirmable

  end
end
