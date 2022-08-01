class Admin::CustomsController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end


 private
 def customer_params
  params.require(:customer).permit(:email, :last_name,
  :last_name, :first_name, :last_name_kana,
  :first_name_kana, :postal_code, :address,
  :telephone_number, :is_deleted)
 end
end