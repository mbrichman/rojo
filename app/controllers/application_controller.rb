class ApplicationController < ActionController::Base
  protect_from_forgery

  def signed_in?
    return session[:user_id].present?
  end

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
