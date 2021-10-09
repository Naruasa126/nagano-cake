class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.new
    @addresses = Address.all
  end

  def edit
    @addresses = Address.find(params[:id])
  end

  def create
    @addresses = Address.new(addresses_params)
    @addresses.customer_id = current_customer.id
    @addresses.save
    redirect_to  public_addresses_path
  end

  def update
    @addresses = Address.find(params[:id])
    @addresses.update(addresses_params)
    redirect_to  public_addresses_path(current_customer.id)
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end


  private

  def addresses_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
