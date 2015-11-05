class CropsController < ApplicationController
  before_action :set_crop, only: [:show, :edit, :update, :destroy]
  before_action :logged_in
  # before_action :no_access, only: [:edit]

  # GET /crops
  def index
    @crops = Crop.all
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
    @crop.find(params[:trade_types]).trade_types << TradeType.find(params[:id])

    if @crop.save
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
      params.require(:crop).permit(:user_id, :description, :weight, :crop_pic, :crop_type_id)
    end
end
