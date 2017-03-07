class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Declare a helper method and make it available to controllers and views
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end