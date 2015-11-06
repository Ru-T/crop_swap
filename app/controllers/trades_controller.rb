class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]

  # GET /trades
  def index
    @trades = Trade.all
  end

  # GET /trades/1
  def show
  end

  # GET /trades/new
  def new
    @trade = Trade.new#something about crop_id defaulting to crop
  end

  # GET /trades/1/edit
  def edit
  end

  # POST /trades
  def create
    @trade = Trade.new(trade_params)

    if @trade.save
      TradeMailer.new_proposed_trade.deliver_now
      redirect_to @trade, notice: 'Trade was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /trades/1
  def update
    if @trade.update(trade_params)
      if @trade.accepted == true
        TradeMailer.accepted_trade.deliver_now
      elsif @trade.accepted == false
        TradeMailer.rejected_trade.deliver_now
      else
        @trade.save
      end
      redirect_to @trade, notice: 'Trade was successfully updated.'
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
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trade_params
      params.require(:trade).permit(:trade_type_id, :crop_id, :consumer_id, :accepted, :message, :message_response, :crop_pic)
    end
end
