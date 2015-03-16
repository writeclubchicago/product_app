class Product < ActiveRecord::Base
	belongs_to :vendor
	has_many :product_options # always PLURAL
	has_many :orders #always PLURAL
	has_many :categorized_products
	has_many :categories, :through => :categorized_products
	# belongs_to :product_option

	has_many :carted_products
	has_many :orders, :through => :carted_products	


validates :title, :vendor_id, :price, presence: { strict: true }
validates :title, uniqueness: { case_sensitive: false }
validates :title, length: { minimum: 2 }
validates :title, length: { maximum: 2 }

validates :price, numericality: { only_decimal: true }




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
