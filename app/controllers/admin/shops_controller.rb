class Admin::ShopsController < ApplicationController
  def index
    @shops = Shop.all
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save
    redirect_to '/admin/shops'
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to '/admin/shops'
  end

 private
 def shop_params
  params.require(:shop).permit(:shop_id, :name)
 end
end
