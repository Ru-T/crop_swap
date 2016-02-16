class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  before_action :no_edit, only: [:edit]
  before_action :logged_in

  # GET /trades
  def index
    @trades = Trade.where(grower_id: session[:user_id]).or(Trade.where(consumer_id: session[:user_id]))
    #Trade.user_trades(@current_user)
  end

  # GET /trades/new
  def new
    @trade = Trade.new(crop_id: params[:crop_id], consumer: @current_user)
  end

  # POST /trades
  def create
    @trade = Trade.new(trade_params)
    @grower = User.find_by_id(@trade[:grower_id])

    if @trade.save
      TradeMailer.new_proposed_trade(@grower.email).deliver_now
      redirect_to crops_path, notice: 'Your swap has been proposed.'
    else
      render :new
    end
  end

  # PATCH/PUT /trades/1
  def update
    @consumer = User.find_by_id(@trade[:consumer_id])
    @grower = User.find_by_id(@trade[:grower_id])

    if @trade.update(trade_params)
      if @trade.accepted == true
        TradeMailer.accepted_trade(@consumer.email).deliver_now
      elsif @trade.accepted == false
        TradeMailer.rejected_trade(@consumer.email).deliver_now
      else
        TradeMailer.modified_trade(@grower.email).deliver_now
      end
      redirect_to crops_path, notice: 'Your swap was successfully acted upon.'
    else
      render :edit
    end
  end

  # DELETE /trades/1
  def destroy
    @trade.destroy
    redirect_to trades_url, notice: 'Trade was successfully destroyed.'
  end

  private
    def no_edit
      if @trade.accepted == false || @trade.accepted == true
        redirect_to crops_path, notice: "You cannot edit a trade once it has been acted upon."
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trade_params
      params.require(:trade).permit(:trade_type_id, :crop_id, :consumer_id, :accepted, :message, :message_response, :crop_pic, :grower_id)
    end
end
