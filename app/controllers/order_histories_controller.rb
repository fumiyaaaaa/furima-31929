class OrderHistoriesController < ApplicationController
  def index
    @order = Order.new
  end
end
