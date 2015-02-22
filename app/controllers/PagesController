class PagesController < ApplicationController

  def form
  end

  def submit
    @message = params[:message]
  end

  def get_params
    @message = params[:message]
    @second_message = params[:message2]
  end

  def slug
    @message = params[:message]
  end

  def game
    
  end

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
end
