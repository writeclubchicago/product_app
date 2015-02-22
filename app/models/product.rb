class Product < ActiveRecord::Base
	belongs_to :vendor
	has_many :product_options # always PLURAL
	has_many :orders #always PLURAL
	# belongs_to :product_option

# end 
# class Product < ActiveRecord::Base
# end

def speak
	`say 'I am a product.`
end

def array_of_products
	# return product_list.split(",")
	return description.split(",")
end 


# def array_of_instructions
# 	# return product_list.split(",")
# 	return instructions.split(",")
# end 

def friendly_time
	Time.now.strftime("%I:%M:%S %p") 
end 

def friendly_created_at
 created_at.strftime("%b %e, %l:%M %p")
end 

def friendly_updated_at
 updated_at.strftime("%b %e, %l:%M %p")
end 


def salemessage
	if price < 19
		return "Discount Item!"
	else
		return "On Sale!"
	end 
end 


def subtotal 
return price
end

def tax 
return price * 0.09

end

def total 
# return price * 1.09
return price + tax 
end 


end
