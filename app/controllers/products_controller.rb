class ProductsController < ApplicationController
#original index
# def index
# 	@products = Product.all  
# 	if params[:sort] == "title"
# 		@products = Product.order(:title)
# 	end
# end 

def index
	@products = Product.all  
	if params[:sort] == "title"
		@products = Product.order(:title)
	end 
	if params[:filter] == "discount"
		@products = Product.where("price <= ?", 16)
	end 
	if params[:sort] == "pricelow"
		@products = Product.order(:price)
	end
	# if params[:sort] 
	# 	@products = @products.order(:params[:sort] => params[:direction])
	# end

	if params[:sort] == "pricehigh"
		@products = Product.order(:price => :desc)
	end	

	if params[:sort] == "created_at"
		@products = Product.order(:created_at => :desc)
	end	

	if params[:filter] == "categoryawesome"
		@products = Product.where("category =?", "Awesome")
	end 

	if params[:filter] == "categorypets"
		@products = Product.where("category =?", "Pets")
	end 	

	if params[:search]
		@products = @products.where('title LIKE ?', "%" + params[:search] + "%")

		end
	# @users = Users.all 

end 

def new
end

def create
	product = Product.create({:title => params[:title], :price => params[:price], :image => params[:image], :description => params[:description], :category => params[:category]})

		# :user_id => current_user.id})

		# :brand => params[:brand]})
	# Product.create({:title => params[:title], :price => params[:price], :image => params[:image], :description => params[:description], :category => params[:category], :brand => params[:brand]})
	# redirect_to "/products/<%= {params.[id]} %>"
	redirect_to "/products/#{product.id}"
	flash[:success] = "Product added."
	# redirect_to '/products'
	# redirect_to '/products/<%= product.id %>'	

end

def update
	product = Product.find(params[:id])
	product.update({:title => params[:title], :price => params[:price], :image => params[:image], :description => params[:description], :category => params[:category]})
		# :brand => params[:brand]})
	@product = Product.find(params[:id])
	flash[:success] = "Product updated."
	# redirect_to '/products' //works
	redirect_to "/products/<%= {params.[id]} %>"	
			# @product = Product.find(params[:id])

end

def destroy
	@product = Product.find(params[:id])
	@product.destroy
	flash[:danger] = "Product destroyed."
	redirect_to '/products'
end 

def show
	# @product = Product.find(params[:id])
	if params[:id] == "random"
	@product = Product.all.sample
	else
		@product = Product.find(params[:id])
	end 
end

def addproductform
end 

def display
	@products = Product.all
end 

# def all_the_people
# 	@employees = Employee.all 
# end 


def edit
	@product = Product.find(params[:id])
end 

def submit #actions by web page
# add jc 
    @users_guess = params[:guess].to_i

    if cookies[:number_of_guesses]
      cookies[:number_of_guesses] = cookies[:number_of_guesses].to_i + 1
    else
      cookies[:number_of_guesses] = 1
    end




winning = 20
	@message = params[:message]
	@message2 = ""
	@image = ""
	x = @message.to_i

	# if @message == 0
	# 	@message = "Your input was invalid"

	if x > winning
		@message2 = "Guess BLAHHHH lower"
		@image = "http://images2.fanpop.com/images/polls/112302_1220201412092_full.jpg"
	elsif x < winning
		@message2 = "Guess higher"
		@image = "https://rustbeltbliss.files.wordpress.com/2013/01/charlie-brown.jpg"
	else 
		@message2 = "Winning"
		@image = "http://www.spencersonline.com/images/spencers/products/interactivezoom/processed/02324432.interactive.a.jpg"
	
    flash[:success] = "Your guess was #{@users_guess}"
    # flash[:info] = @message
    flash[:info] = @message2    
    flash[:danger] = "You have made #{cookies[:number_of_guesses]} guesses so far."
    # redirect_to '/number-game'
    redirect_to '/numberguessform'



	end 
end 


# get '/numberguessform' => 'products#form_numberguess'

def form_numberguess #actions by web page
	if cookies[:winning_number].nil?
	cookies[:winning_number] = rand(1..2)
end 

	# def numberguesssubmit #actions by web page
	# 	@message = params[:message]
	# end 

def hellopage
end 

def numberguess
    #winning_number = 26
    cookies[:winning_number].to_i
    @users_guess = params[:guess].to_i

    if cookies[:number_of_guesses]
      cookies[:number_of_guesses] = cookies[:number_of_guesses].to_i + 1
    else
      cookies[:number_of_guesses] = 1
    end

if @users_guess = 0
	@message = "Your input was invalid"
elsif @users_guess > winning_number
	@message = "Guess lower"
elsif @users_guess < winning_number
	@message = "Guess higher"
else
	@message = "You've won!"
	cookies[:winning_number] = rand(1..2)
	cookies[:number_of_guesses] = 0
	# cookies.delete(:number_of_guesses)
end 

    flash[:success] = "Your guess was #{@users_guess}"
    # flash[:info] = @message
    flash[:info] = @message2    
    flash[:danger] = "You have made #{cookies[:number_of_guesses]} guesses so far."
    # redirect_to '/number-game'
    redirect_to '/numberguessform'
end 
end 
# jeff comment out 2/22/2015
	# winning = 20
	# @message = params[:message]
	# @message2 = ""
	# @image = ""
	# x = @message.to_i

	# if x > winning
	# 	@message2 = "Guess lower"
	# 	@image = "http://images2.fanpop.com/images/polls/112302_1220201412092_full.jpg"
	# elsif x < winning
	# 	@message2 = "Guess higher"
	# 	@image = "https://rustbeltbliss.files.wordpress.com/2013/01/charlie-brown.jpg"
	# else 
	# 	@message2 = "Winning"
	# 	@image = "http://www.spencersonline.com/images/spencers/products/interactivezoom/processed/02324432.interactive.a.jpg"
	# end 
# jeff comment out 2/22/2015



def get_params
@message = params[:message]
@second_message = params[:message2]

end 

def slug
	@message = params[:message]
end 

end

# def form #actions by web page
# end

# def submit #actions by web page
# 	@message = params[:message]
# end 
 def submit_guess
    winning_number = 26
    @users_guess = params[:guess].to_i

    if cookies[:number_of_guesses]
      cookies[:number_of_guesses] = cookies[:number_of_guesses].to_i + 1
    else
      cookies[:number_of_guesses] = 1
    end

    #to delete a cookie:
    # cookies[:number_of_guesses] = nil

    if @users_guess == 0
      @message = "Your input was invalid"
    elsif @users_guess > winning_number
      @message = "Guess lower"
    elsif @users_guess < winning_number
      @message = "Guess higher"
    else
      @message = "You've won!"
    end

    flash[:success] = "Your guess was #{@users_guess}"
    flash[:info] = @message
    flash[:danger] = "You have made #{cookies[:number_of_guesses]} guesses so far."
    redirect_to '/number-game'
  end

  def game2
    winning_number = 26
    @users_guess = params[:guess].to_i

    if @users_guess == 0
      @message = "Your input was invalid"
    elsif @users_guess > winning_number
      @message = "Guess lower"
    elsif @users_guess < winning_number
      @message = "Guess higher"
    else
      @message = "You've won!"
    end

  end



# def submit_message
# 	Employee.create({:first_name =>params[:first], :last_name => params[:last], :title => params[:title]})

# end 


