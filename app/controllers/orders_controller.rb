class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
   if params[:order][:selected_address] == "0"
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.adress = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
   elsif params[:order][:selected_address] == "1"
    @order = Order.new(order_params)
    @order.postal_code = Adress.find(params[:order][:adress_id]).postal_code
    @order.adress = Adress.find(params[:order][:adress_id]).adress
    @order.name = Adress.find(params[:order][:adress_id]).name
   else
    @order = Order.new(order_params)
   end
   @total = 0
  end

  def create
    @order = Order.new(order_params)
    @order.save
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      #@order_detail.order_id = @order.id
      #@order_detail.item_id = cart_item.item_id

    end
    @order.shopping_cost = 800
  end
end

private
def order_params
  params.require(:order).permit(:payment_method,
  :postal_code, :adress, :name, :customer_id,
  :shopping_cost, :total_price)
end

def item_params
  params.require(:item).permit(:name, :introduction,
  :image, :price)
end

def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
end

def adress_params
  params.require(:adress).permit(:postal_code, :adress, :name)
end