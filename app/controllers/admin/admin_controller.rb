class Admin::AdminController < ApplicationController
  before_action :verify_admin

  def verify_admin
    if logged_in? && current_user.admin?
      flash[:danger] = t ".not_admin"
      redirect_to root_url
    end
  end
end
