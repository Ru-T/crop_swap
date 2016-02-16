class UsersController < ApplicationController

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :name, :phone_number, :description, :zip_code, :profile_pic)
    end
end
