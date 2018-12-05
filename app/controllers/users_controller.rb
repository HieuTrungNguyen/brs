class UsersController < ApplicationController
  before_action :load_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:info] = t ".signup_success"
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def show; end

  private
  def user_params
    params.require(:user).permit :username, :email, :password, :password_confimation
  end

  def load_user
    @user = User.find_by id: params[:id]
    render_404 unless @user
  end
end
