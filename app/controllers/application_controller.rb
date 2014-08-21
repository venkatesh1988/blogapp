class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :noticeuser
<<<<<<< HEAD

  
  
  private 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end  
  helper_method :current_user
=======
>>>>>>> c7db8d0f72239ae67c65079bcebc55d46971b51a
end
