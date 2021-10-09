class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:customers]).per(10)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def show
    @customers = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customers_params)
    redirect_to admin_customer_path(@customer.id)
  end

  private

  def customers_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,:postal_code, :address, :telephone_number, :email, :is_active)
  end
end
