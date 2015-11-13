class CropsController < ApplicationController
  before_action :set_crop, only: [:show, :edit, :update, :destroy]
  before_action :logged_in, except: [:index]
  # before_action :no_access, only: [:edit]

  # GET /crops
  def index
    @current_user = User.find_by_id(session[:user_id])
    @crops = Crop.available_crops(@current_user)
  end

  def graph
  end

  def map
  end

  # GET /crops/1
  def show
  end

  # GET /crops/new
  def new
    @crop = Crop.new(user: @current_user)
  end

  # GET /crops/1/edit
  def edit
  end

  # POST /crops
  def create
    @crop = Crop.new(crop_params)

    if @crop.save
      @crop.trade_types = params[:trade_types].map {|id| TradeType.find(id)}
      redirect_to @current_user
    else
      render :new
    end
  end

  # PATCH/PUT /crops/1
  def update
    if @crop.update(crop_params)
      redirect_to @crop, notice: 'Crop was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /crops/1
  def destroy
    @crop.destroy
    redirect_to crops_url, notice: 'Crop was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crop
      @crop = Crop.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def crop_params
      params.require(:crop).permit(:user_id, :description, :weight, :crop_pic,
      :crop_type_id, :ripe_on, :expires_on)
    end
end
