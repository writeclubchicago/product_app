class ProductOption < ActiveRecord::Base
	belongs_to :product
	has_many :orders	
	 # has_many :products
# has_many :product_option	 
end
