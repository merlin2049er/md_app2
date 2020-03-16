class CreateTaxes < ActiveRecord::Migration[6.0]
  def change
    create_table :taxes do |t|
      t.string :prov_id
      t.float :tax_rate
      t.boolean :enabled
      t.string :comment

      t.timestamps
    end
  end
end
