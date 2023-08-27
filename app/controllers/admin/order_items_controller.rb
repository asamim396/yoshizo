class Admin::OrderItemsController < ApplicationController
  def update
    @order = Order.find(params[:order_id])
  end
end