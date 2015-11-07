class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  before_action :no_edit, only: [:edit]

  # GET /trades
  def index
    @trades = Trade.all
  end

  # GET /trades/1
  def show
  end

  # GET /trades/new
  def new
    @trade = Trade.new
  end

  # GET /trades/1/edit
  def edit
  end

  # POST /trades
  def create
    @trade = Trade.new(trade_params)
    @grower = User.find_by_id(:grower_id)

    if @trade.save
      TradeMailer.new_proposed_trade(@grower.email).deliver_now
      redirect_to @trade, notice: 'Trade was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /trades/1
  def update
    @consumer = User.find_by_id(:consumer_id)
    @grower = User.find_by_id(:grower_id)

    if @trade.update(trade_params)
      if @trade.accepted == true
        TradeMailer.accepted_trade(@consumer.email).deliver_now
      elsif @trade.accepted == false
        TradeMailer.rejected_trade(@consumer.email).deliver_now
      else
        TradeMailer.modified_trade(@grower.email).deliver_now
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
