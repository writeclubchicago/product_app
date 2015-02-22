class CreateProductOptions < ActiveRecord::Migration
  def change
    create_table :product_options do |t|
      t.string :product_id
      t.string :optionone
      t.string :optiontwo
      t.string :optionthree

      t.timestamps null: false
    end
  end
end
