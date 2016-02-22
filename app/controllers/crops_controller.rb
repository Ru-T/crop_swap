class CropsController < ApplicationController
  before_action :set_crop, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    if current_user
      @crops = Crop.available_crops(current_user)
                   .order(params[:sort])
                   .page(params[:page])
    else
      @crops = Crop.all
    end
  end

  def new
    @crop = Crop.new(user: current_user)
  end

  def create
    @crop = Crop.new(crop_params)

    if @crop.save
      @crop.trade_types = params[:trade_types].map {|id| TradeType.find(id)}
      redirect_to current_user
    else
      render :new
    end
  end

  def update
    if @crop.update(crop_params)
      redirect_to @crop, notice: 'Crop was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @crop.destroy
    redirect_to crops_url, notice: 'Crop was successfully destroyed.'
  end

  private
    def set_crop
      @crop = Crop.find(params[:id])
    end

    def crop_params
      params.require(:crop).permit(
        :user_id,
        :description,
        :weight,
        :crop_pic,
        :crop_type_id,
        :ripe_on,
        :expires_on
      )
    end
end
