class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "User logged in succesfully"
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'There is something went wrong'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "you have logged out"
    redirect_to root_path
  end


end
