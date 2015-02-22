class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :quantity
      t.integer :product_option_id
      t.decimal :subtotal
      t.decimal :tax
      t.decimal :total
      t.string :status
      t.string :comments

      t.timestamps null: false
    end
  end
end
