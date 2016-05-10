class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SignInHelper
  def working_user  
	@working_user ||= UserDetail .find_by(username: session[:user_id])
  end
  helper_method :working_user
end
