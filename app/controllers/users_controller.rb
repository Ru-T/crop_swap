class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      current_user = @user
      redirect_to edit_user_path(@user)
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to new_crop_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    def no_access
      redirect_to crops_path, notice: "You do not have access to this information." unless @current_user == @user
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :name, :phone_number, :description, :zip_code, :profile_pic)
    end
end
