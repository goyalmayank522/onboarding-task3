class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(params.require(:user).permit(:username, :password))
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Please enter the Username/Password carefully!"
      redirect_to '/users'
    end
  end
end
