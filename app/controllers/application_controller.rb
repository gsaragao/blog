class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected 
  
  def current_user
      return unless session[:usuario_id]
      @current_user ||= Usuario.find_by_id(session[:usuario_id])
  end
  
  helper_method :current_user
  
  def authenticate
      logged_in? ? true : access_denied
  end
  
  def logged_in?
      current_user.is_a? Usuario
  end
  
  helper_method :logged_in?
  
  def access_denied
      redirect_to login_path, :notice => "Please log in to continue" and return false
  end  
      
end
