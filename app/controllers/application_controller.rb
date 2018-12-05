class ApplicationController < ActionController::Base
  include SessionsHelper

  protected
  def render_404
    render file: "#{Rails.root}/public/404.html", layouts: false, status: 404
  end
end
