class SessionController < ApplicationController

  def new
  end

  def create
    u = User.find_by_email(params[:email])
    if u && u.authenticate(params[:password])
      redirect_to crops_path
      session[:user_id] = u.id
    else
      redirect_to session_new_path, notice: 'Invalid username/password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to session_new_path
  end

end
