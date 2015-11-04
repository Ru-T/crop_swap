class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private def logged_in
    redirect_to session_new_path unless session[:user_id]
  end

  def no_access
    redirect_to crops_path, notice: "You do not have access to this information." unless session[:user_id]
  end

end
