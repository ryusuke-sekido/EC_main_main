class Admin::HomesController < ApplicationController

  def top
    @total = 0
    @orders = Order.all
  end

  def about
  end

  def thank
  end

 private
 def order_params
  params.require(:order).permit(:payment_method,
  :postal_code, :adress, :name, :customer_id,
  :shopping_cost, :total_price)
 end
end