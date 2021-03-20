class ItemsController < ApplicationController
  before_action
  def index
  end

  def new
    @item = Item.new
  end
end
