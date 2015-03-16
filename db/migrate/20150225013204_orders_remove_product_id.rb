class OrdersRemoveProductId < ActiveRecord::Migration
  def self.up
 rename_column :orders, :product_id, :zproduct_id
  end
  def self.down
  end 

end
