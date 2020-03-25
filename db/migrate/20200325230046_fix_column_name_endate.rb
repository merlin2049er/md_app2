class FixColumnNameEndate < ActiveRecord::Migration[6.0]
  def self.up
   rename_column :products, :endate, :enddate
 end
end
