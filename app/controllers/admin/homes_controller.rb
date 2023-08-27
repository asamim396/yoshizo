class Admin::HomesController < ApplicationController
   def top
    @params = params[:id]
    @order = Order.where(customer_id: @params).order(created_at: :desc)
    @orders = Order.all
   end
end
