class CartedProduct < ActiveRecord::Base
	belongs_to :products
	belongs_to :orders		
	# has_many :products, :through => :categorized_products

end
