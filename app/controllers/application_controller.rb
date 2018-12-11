class ApplicationController < ActionController::Base
  include SessionsHelper

  protected
  def render_404
    render file: "#{Rails.root}/public/404.html", layouts: false, status: 404
  end

  def verify_admin
    redirect_back_or root_url unless current_user && current_user.admin?
  end
end
