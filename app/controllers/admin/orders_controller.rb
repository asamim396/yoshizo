class Admin::OrdersController < ApplicationController
   def show
    @order = Order.find(params[:id])
    @orders = Order.all
    
  
   end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderItem.where(order_id: @order)

    
  end

  private

  
end
