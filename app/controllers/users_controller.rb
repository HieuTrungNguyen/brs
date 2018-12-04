class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:info] = t ".signup_success"
      redirect_to user_url
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :username, :email, :password, :password_confimation
  end
end