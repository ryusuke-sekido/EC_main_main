class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order.shopping_cost = 800
  end

  def update
   @order = Order.find(params[:id])
   @order.update(order_params)
   redirect_to admin_homes_top
  end

 private
 def order_params
  params.require(:order).permit(:payment_method,
  :postal_code, :adress, :name, :customer_id,
  :shopping_cost, :total_price)
 end

 def customer_params
  params.require(:customer).permit(:last_name)
 end
end