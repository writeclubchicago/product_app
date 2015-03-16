class CartedProductsController < ApplicationController
  before_action :authenticate_user! #, :only => [:create]

  def index
    # if user_signed_in?
      @order = Order.find_by(:user_id => current_user.id, :status => "carted")
      if @order
        @carted_products = @order.carted_products
      else
        flash[:warning] = "There is nothing in your shopping cart."
        redirect_to "/"
      end
    # else
    #   flash[:warning] = "You can't do that, dear friend!"
    #   redirect_to "/"
    # end
  end

  def create
    order = Order.find_by(:status => "carted", :user_id => current_user.id)
    
    if order
      CartedProduct.create(:product_id => params[:product_id], :quantity => params[:quantity], :order_id => order.id)
    else
      Order.create(:status => "carted", :user_id => current_user.id)
      CartedProduct.create(:product_id => params[:product_id], :quantity => params[:quantity], :order_id => order.id)
    end
    flash[:success] = "Added to shopping cart!"
    redirect_to '/'
  end


end
