class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:destroy]
  before_action :authenticate_user!

  def index
    @wishlists = Wishlist.where(user: current_user)
  end
  
  def create
    @wishlist = Wishlist.new(wishlist_params)
    if @wishlist.save
      redirect_to @wishlist
    else
      render :new
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
