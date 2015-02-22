class OrdersController < ApplicationController

def create
	product = Product.find(params[:product_id])
	quantity = params[:quantity].to_i
	tax = product.price * quantity * 0.09
	subtotal = product.price * quantity
	total = subtotal + tax

	# Order.create(:quantity => quantity, :user_id => current_user.id, :product_id => product.id, :subtotal => product.price * quantity, :tax => tax, :total => total)

	order = Order.new(:quantity => quantity, :user_id => current_user.id, :product_id => product.id) 
		order.subtotal = order.calculate_subtotal, 
		order.tax = order.calculate_tax, order.total = order.calculate_total)

	order.save


	flash[:success] = "Thanks for shopping"
	redirect_to "/products"
	end 
end 