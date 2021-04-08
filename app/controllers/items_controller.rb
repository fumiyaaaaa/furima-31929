class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  before_action :find_item, only:[:show, :edit, :update, :destroy]
  before_action :judge_user, only:[:edit, :update, :destroy]
  before_action :sold_out_item, only:[:edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :text, :category_id, :status_id, :delivery_cost_id, :address_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def judge_user
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def sold_out_item
    if @item.order_history.present?
      redirect_to root_path
    end
  end
end
