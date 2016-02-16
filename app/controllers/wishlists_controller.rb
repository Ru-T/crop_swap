class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:destroy]
  before_action :logged_in

  def index
    @wishlists = Wishlist.where(user_id: session[:user_id])
  end

  def new
    @wishlist = Wishlist.new
  end

  def create
    @wishlist = Wishlist.new(wishlist_params)
    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to @wishlist }
        format.json { render :show, status: :created, location: @wishlist }
      else
        format.html { render :new }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wishlist.destroy
    redirect_to wishlists_url
  end

  private
    def set_wishlist
      @wishlist = Wishlist.find(params[:id])
    end

    def wishlist_params
      params.require(:wishlist).permit(:user_id, :crop_id)
    end
end
