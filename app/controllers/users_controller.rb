class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome to alpha blog #{@user.user}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:user, :email, :password)
  end


end