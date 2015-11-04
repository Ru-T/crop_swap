class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private def logged_in
    @current_user = User.find_by_id(session[:user_id])
    redirect_to session_new_path unless @current_user
  end

  private def no_access
    redirect_to crops_path, notice: "You do not have access to this information." unless @current_user == @user
  end

end
