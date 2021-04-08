class OrderHistoriesController < ApplicationController
  before_action :authenticate_user!, only:[:index, :create]
  before_action :find_item, only:[:index, :create]
  before_action :judge_user, only:[:index, :create]
  #before_action :sold_out_item, only:[:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:postal_code, :address_id, :municipality, :block_number, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def judge_user
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end 

  #def sold_out_item
    #if @item.order_history.present?
      #redirect_to root_path
    #end
  #end
end

