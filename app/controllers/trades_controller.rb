class TradesController < ApplicationController
  before_action :set_trade, only: [:edit, :update, :destroy]
  before_action :no_edit, only: [:edit]
  before_action :authenticate_user!

  def index
    @trades = Trade.trades(current_user)
  end

  def new
    @trade = Trade.new(
               crop_id: params[:crop_id],
               consumer: current_user
             )
  end

  def create
    @trade = Trade.new(trade_params)
    if @trade.save
      @trade.email_trade_proposal
      redirect_to crops_path, notice: 'Your swap has been proposed.'
    else
      render :new
    end
  end

  def update
    if @trade.update(trade_params)
      @trade.email_trade
      redirect_to crops_path, notice: 'Your swap was successfully acted upon.'
    else
      render :edit
    end
  end

  def destroy
    @trade.destroy
    redirect_to trades_url, notice: 'Trade was successfully destroyed.'
  end

  private
    def no_edit
      if @trade.accepted != nil
        redirect_to crops_path, notice: "You cannot edit a trade once it has been acted upon."
      end
    end

    def set_trade
      @trade = Trade.find(params[:id])
    end

    def trade_params
      params.require(:trade).permit(
        :trade_type_id,
        :crop_id,
        :consumer_id,
        :accepted,
        :message,
        :message_response,
        :crop_pic
      )
    end
end
