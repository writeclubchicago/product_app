class Order < ActiveRecord::Base
	belongs_to :products # a	
	belongs_to :users # a	
	belongs_to :product_options # a

	has_many :carted_products
	has_many :products, :through => :carted_products	


# 	SALES_TAX = 0.09  # constant variable

# def calculate_subtotal
# 	return product.price * quantity
# end

# def calculate_tax
# 	return SALES_TAX * calculate_subtotal
# end

# def calculate_total
# 	return calculate_tax + calculate_subtotal
# end


end
