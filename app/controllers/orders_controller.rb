class OrdersController < ApplicationController

	def create 
product = Product.find(params[:product_id])
quantity = params[:quantity].to_i
order = Order.new(:quantity => quantity, :user_id => current_user.id, :zproduct_id => product.id)
order.subtotal = order.calculate_subtotal
order.tax = order.calculate_tax
order.total = order.calculate_total
order.save
	end


# def create # code out jc 2015 0226
# 	product = Product.find(params[:product_id])
# 	quantity = params[:quantity].to_i
# # jeff comment out 2015 0222 3 pm
# 	tax = product.price * quantity * 0.09
# 	subtotal = product.price * quantity
# 	total = subtotal + tax
# # jeff comment out 2015 0222 3 pm

# 	Order.create(:quantity => quantity, :user_id => current_user.id, :product_id => product.id, :subtotal => product.price * quantity, :tax => tax, :total => total)
# # jeff comment out 2015 0222 315 pm	
# 	# order = Order.new(:quantity => quantity, :user_id => current_user.id, :product_id => product.id)
# 	# 	order.subtotal = order.calculate_subtotal, 
# 	# 	order.tax = order.calculate_tax, order.total = order.calculate_total
# #	order.save
# # jeff comment out 2015 0222 315 pm	
# 	flash[:success] = "Thanks for shopping"
# 	redirect_to "/products"
# 	end 


def update
	order = Order.find(params[:id])
	order.update(:status => "purchased")
	flash[:success] = "Thanks for shopping!"
	redirect to "/products"
end 
end 

