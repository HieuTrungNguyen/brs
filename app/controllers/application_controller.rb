class ApplicationController < ActionController::Base
  include SessionsHelper

  protected
  def render_404
    render file: "#{Rails.root}/public/404.html", layouts: false, status: 404
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t "must_login"
      redirect_to login_url
    end
  end

  def verify_admin
    redirect_back fallback_location: root_path unless current_user && current_user.admin?
  end
end
