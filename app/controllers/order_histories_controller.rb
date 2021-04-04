class OrderHistoriesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  def order_params
    params.require(:order).permit(:postal_code, :address_id, :municipality, :block_number, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end 
end

