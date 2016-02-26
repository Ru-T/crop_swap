class SwapsController < ApplicationController
  before_action :set_swap, only: [:edit, :update, :destroy]
  before_action :no_edit, only: [:edit]
  before_action :authenticate_user!

  def index
    @swaps = Swap.swaps(current_user)
  end

  def new
    @swap = Swap.new(
               crop_id: params[:crop_id],
               consumer: current_user
             )
  end

  def create
    @swap = Swap.new(swap_params)
    if @swap.save
      @swap.email_swap_proposal
      redirect_to crops_path, notice: 'Your swap has been proposed.'
    else
      render :new
    end
  end

  def update
    if @swap.update(swap_params)
      @swap.email_swap
      redirect_to crops_path, notice: 'Your swap was successfully acted upon.'
    else
      render :edit
    end
  end

  def destroy
    @swap.destroy
    redirect_to trades_url, notice: 'Swap was successfully destroyed.'
  end

  private
    def no_edit
      if @swap.accepted != nil
        redirect_to crops_path, notice: "You cannot edit a swap once it has been acted upon."
      end
    end

    def set_swap
      @swap = Swap.find(params[:id])
    end

    def swap_params
      params.require(:swap).permit(
        :swap_type_id,
        :crop_id,
        :consumer_id,
        :accepted,
        :message,
        :message_response
      )
    end
end
