class AddAttributeToProductId < ActiveRecord::Migration
	def change 	
		change_table :products do |t|
		      t.integer :vendor_id
	end
	end
end 