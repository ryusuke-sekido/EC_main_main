class AdressesController < ApplicationController
  def new
  end
  
  def index
    @adresses = Adress.all
    @adress = Adress.new
  end
  
  def create
    @adress = Adress.new(adress_params)
    @adress.customer_id = current_customer.id
    @adress.save
    redirect_to adresses_path
  end

  def edit
    @adress = Adress.find(params[:id])
  end

  def show
  end

  def update
    adress = Adress.find(params[:id])
    adress.update(adress_params)
    redirect_to adresses_path
  end
end

private
def adress_params
  params.require(:adress).permit(:postal_code, :adress, :name)
end
