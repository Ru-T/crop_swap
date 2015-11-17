class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :edit, :update, :destroy]
  before_action :logged_in

  # GET /wishlists
  def index
    @wishlists = Wishlist.where(user_id: session[:user_id])
  end

  # GET /wishlists/1
  def show
  end

  # GET /wishlists/new
  def new
    @wishlist = Wishlist.new
  end

  # GET /wishlists/1/edit
  def edit
  end

  # POST /wishlists
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

  # PATCH/PUT /wishlists/1
  def update
    if @wishlist.update(wishlist_params)
      redirect_to @wishlist, notice: 'Wishlist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /wishlists/1
  def destroy
    @wishlist.destroy
    redirect_to wishlists_url, notice: 'Wishlist was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist
      @wishlist = Wishlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wishlist_params
      params.require(:wishlist).permit(:user_id, :crop_id)
    end
end
