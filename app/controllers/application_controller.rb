class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user  

  private  
  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end

  def authenticate_user!
    if !current_user
      flash[:error] = 'You need to sign in before accessing this page!'
      redirect_to '/auth/google'
    end
  end
end
